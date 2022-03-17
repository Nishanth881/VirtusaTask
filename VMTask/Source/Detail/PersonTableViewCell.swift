

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var personNameLbl: UILabel!
    @IBOutlet  var designationLabel:UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    var task: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(person:Person) {
        personNameLbl.text = person.firstName ?? "" + "\(person.lastName ?? "")"
        designationLabel.text = person.jobtitle ?? ""
        idLabel.text = person.id ?? ""
        downloadPosterImage(person.avatar ?? "")
    }

}

extension PersonTableViewCell {
    
    func downloadPosterImage(_ imageBaseURL:String) {
        if task == nil {
        task = personImage.downloadImage(from: imageBaseURL)
    }
}
}
