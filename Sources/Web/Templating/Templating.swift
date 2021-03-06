import Foundation

import NaamioCore
import NaamioTemplateEngine

import Malline



/// Templating provides the tools necessary to take content
/// and provide it in a structured method to the end-user.
class Templating {
    
    static let `default` = Templating()
    
    let engine = NaamioTemplateEngine()
    
    /// List of templates within Templating instance.
    var templates: Templatable?
    
    var cache: [TemplateCachable]?
    
    var path: String {
        get {
            return (templates?.base)!
        }
    }
    
    init() {
        let path = Configuration.settings.web.templates
        
        do {
            templates = try TemplateLoader(withPath: path).load()
            try self.cacheTemplates()
        } catch {
            Log.error("Cannot cache templates")
        }
        
    }
    
    private func cacheTemplates() throws {
        Log.trace("Caching templates")

        let _ = try templates?.routable.map( {
            try cacheTemplate(template: $0)
        } )
    }
    
    private func cacheTemplate( template: Template) throws {
        Log.trace("Caching " + path + template.location! + "/" + template.name)
        let stencil: Stencil = try engine.cacheTemplate(filePath: path + template.location! + "/" + template.name)
        cache?.append(TemplateCachedItem(template: template, stencil: stencil))
    }
}
