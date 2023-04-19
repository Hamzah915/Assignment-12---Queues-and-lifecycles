//
//  TableViewController.swift
//  Fruit MVVM
//
//  Created by Hamzah Azam on 13/04/2023.
//

import UIKit

class TableViewController: UIViewController {
    
    var listViewModel = ListViewModel(anyManager: NetworkManagerClosure())
    @IBOutlet weak var tableView: UITableView!
    
    
    //VIEWCONTROLLER LIFE-CYCLES METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        
        LVMReloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View will appear as view is added to a view hierarchy")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View did appear as view was added to a view hierarchy")
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("View did disappear as view was removed from a view hierarchy")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View will disappear as view is about to be removed from a view hierarchy")
    }
    
    
    func LVMReloadData(){
        listViewModel.getDataUsingClosures(url: "https://fruityvice.com/api/fruit/all")
        listViewModel.reloadMyData = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCellID") as! FirstTableViewCell
        let user = listViewModel.fruits[indexPath.row]
        cell.nameLabel.text = user.name
        return cell
    }



}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let fruit = fruits[indexPath.row]
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: "TableViewController") as? TableViewController else {return}
//        print(fruit)
//        //detailVC.fruits = fruit
//        self.navigationController?.pushViewController(detailVC, animated: true)

    }
}

