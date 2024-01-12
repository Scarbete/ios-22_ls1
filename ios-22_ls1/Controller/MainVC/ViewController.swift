import UIKit



class ViewController: UIViewController {
    
//    weak let controller = MainController()
//    weak var controller = MainController()
    var controller: MainController?
    
    private var notes: [String] = []
    
    private let notes2: [String] = [
        "Quasar", "Quasar", "Ayaki", "Yaridx", "Naarkz", "Grizz", "UlbiTV", "Kutman", "createSlice", "Hanzu",
    ]
    
    private let notes3: [String] = [
        "Ayaki", "Quasar", "Ayaki", "Yaridx", "Naarkz", "Grizz", "UlbiTV", "Kutman", "createSlice", "Hanzu",
    ]
    
    private lazy var notesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(NoteCell.self, forCellWithReuseIdentifier: NoteCell.reuseId)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iniUI()
    }
    
    private func iniUI() {
        view.backgroundColor = .systemBackground
        
        setupNotesCollectionView()
        controller = MainController(view: self)
        controller?.onGetNotes()
    }
    
    private func setupNotesCollectionView() {
        view.addSubview(notesCollectionView)
        
        NSLayoutConstraint.activate([
            notesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func onSuccessNotes(notes: [String]) {
        self.notes = notes
        notesCollectionView.reloadData()
    }

    deinit {
        print("ViewController end = deallocated")
    }
    
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        notes.count
//        switch section {
//        case: 0
//            return notes.count
//        case: 1
//            return notes2.count
//        case: 2
//            return notes3.count
//        default:
//            return notes.count
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCell.reuseId, for: indexPath) as! NoteCell
        cell.setup(title: notes[indexPath.row])
        return cell
    }
    
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
