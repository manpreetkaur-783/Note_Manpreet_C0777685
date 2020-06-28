
import UIKit
import CoreData

class DatabaseHelper: NSObject {

    static let shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    //MARK:- SUBJECTSDB Methods
    
    func saveSubjectData(SubjectDict: [String:String]){
        let Subject = NSEntityDescription.insertNewObject(forEntityName: "SubjectsDB", into: context) as! SubjectsDB
        Subject.title = SubjectDict["subjectName"]
        
        do{
            try context.save()
        }catch let err{
            print("Subjects save error :- \(err.localizedDescription)")
        }
    }
    
    func getAllSubjectData() -> [SubjectsDB]{
        var arrSubject = [SubjectsDB]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SubjectsDB")
        do{
            arrSubject = try context.fetch(fetchRequest) as! [SubjectsDB]
        }catch let err{
            print("Error in Subject fetch :- \(err.localizedDescription)")
        }
        return arrSubject
    }
    
    func deleteSubjectData(index: Int) -> [SubjectsDB]{
        var SubjectData = self.getAllSubjectData() // GetData
        context.delete(SubjectData[index]) // Remove From Coredata
        SubjectData.remove(at: index) // Remove in array Subject
        do{
            try context.save()
        }catch let err{
            print("delete Subject data :- \(err.localizedDescription)")
        }
        return SubjectData
    }
    
    func editSubjectData(SubjectDict: [String : String], index:Int){
        let Subject = self.getAllSubjectData()
    // original data
        Subject[index].title = SubjectDict["subjectName"] // edit data
        do{
            try context.save()
        }catch{
            print("error in edit data")
        }
    }
    
    
     //MARK:- NOTRES DB Methods
    
    
    
    
}
