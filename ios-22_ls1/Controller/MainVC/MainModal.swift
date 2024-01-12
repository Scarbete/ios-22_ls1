import Foundation



class MainModal {
    let notes: [String] = ["Aesthetic", "Quasar", "Ayaki", "Yaridx", "Naarkz", "Grizz", "UlbiTV", "Kutman", "createSlice", "Hanzu",]
//    weak let controller = MainController()
    weak var controller: MainController?
    
    init(controller: MainController) {
        self.controller = controller
    }
    
    func getNotes() {
        controller?.backNotes(notes: notes)
    }
}
