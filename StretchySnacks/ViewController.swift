//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Bennett on 2018-09-13.
//  Copyright © 2018 Bennett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var navBarView: UIView!
  @IBOutlet weak var addButton: UIButton!
  var stackView: UIStackView!
  var imageView1: UIImageView!
  var imageView2: UIImageView!
  var imageView3: UIImageView!
  var imageView4: UIImageView!
  var imageView5: UIImageView!
  @IBOutlet weak var snackTableView: UITableView!
  @IBOutlet weak var navBarHeightConstraint: NSLayoutConstraint!
  
  private var navBarShown = false
  
  private var snackArray = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    imageView1 = UIImageView(image: UIImage(named: "oreos"))
    imageView1.frame = CGRect(x: 0, y: 0, width: navBarView.frame.width / 5, height: 150)
    imageView1.isUserInteractionEnabled = true
    imageView2 = UIImageView(image: UIImage(named: "pizza_pockets"))
    imageView2.frame = CGRect(x: 0, y: 0, width: navBarView.frame.width / 5, height: 150)
    imageView2.isUserInteractionEnabled = true
    imageView3 = UIImageView(image: UIImage(named: "pop_tarts"))
    imageView3.frame = CGRect(x: 0, y: 0, width: navBarView.frame.width / 5, height: 150)
    imageView3.isUserInteractionEnabled = true
    imageView4 = UIImageView(image: UIImage(named: "popsicle"))
    imageView4.frame = CGRect(x: 0, y: 0, width: navBarView.frame.width / 5, height: 150)
    imageView4.isUserInteractionEnabled = true
    imageView5 = UIImageView(image: UIImage(named: "ramen"))
    imageView5.frame = CGRect(x: 0, y: 0, width: navBarView.frame.width / 5, height: 150)
    imageView5.isUserInteractionEnabled = true
    
    let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(addFoodItem (_:)))
    let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(addFoodItem (_:)))
    let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(addFoodItem (_:)))
    let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(addFoodItem (_:)))
    let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(addFoodItem (_:)))
    imageView1.addGestureRecognizer(tapGesture1)
    imageView2.addGestureRecognizer(tapGesture2)
    imageView3.addGestureRecognizer(tapGesture3)
    imageView4.addGestureRecognizer(tapGesture4)
    imageView5.addGestureRecognizer(tapGesture5)
    
    stackView = UIStackView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height:150))
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.addArrangedSubview(imageView1)
    stackView.addArrangedSubview(imageView2)
    stackView.addArrangedSubview(imageView3)
    stackView.addArrangedSubview(imageView4)
    stackView.addArrangedSubview(imageView5)

    navBarView.addSubview(stackView)
    stackView.isHidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func addButtonPressed(_ sender: Any) {
    print("plus button pressed")
    
    UIView.animate(withDuration: 5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      if self.navBarShown{
        
          self.navBarHeightConstraint.constant = 66
          self.addButton.transform.rotated(by: -90)
      }
      else{
          self.navBarHeightConstraint.constant = 200
          self.addButton.transform.rotated(by: 90)

      }
      
      self.navBarShown = !self.navBarShown
      self.stackView.isHidden = !self.navBarShown
      self.navBarView.layoutIfNeeded()
    }, completion: nil)

    
  }
  
  @objc func addFoodItem(_ sender: UITapGestureRecognizer)
  {
    print("Tapped on Image /(sender)")
    switch sender.view {
    case imageView1:
      snackArray.append("Oreos")
    case imageView2:
      snackArray.append("Pizza Pockets")
    case imageView3:
      snackArray.append("Pop Tarts")
    case imageView4:
      snackArray.append("Popsicle")
    default:
      snackArray.append("Ramen")
    }
    
    snackTableView.insertRows(at: [IndexPath(row: snackArray.count-1, section: 0)], with: .automatic)
  }
  
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return snackArray.count
  }
  
 
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = snackTableView.dequeueReusableCell(withIdentifier: "Cell") else{
      
      return UITableViewCell()
    }
    
    cell.textLabel!.text = snackArray[indexPath.row]

    return cell
  }

  
  
}

