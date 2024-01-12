import Foundation
import UIKit



class MainController {
    
//    var model = MainModal()
//    weak var view = ViewController()
    
    var model: MainModal?
    weak var view: ViewController?
    
    init(view: ViewController) {
        self.view = view
        self.model = MainModal(controller: self)
    }
    
    func onGetNotes() {
        model?.getNotes()
    }
    
    func backNotes(notes: [String]) {
        view?.onSuccessNotes(notes: notes)
    }
}
