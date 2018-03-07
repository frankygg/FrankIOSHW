//
//  YouBikeViewController.swift
//  ASiC_YouBike
//
//  Created by WU CHIH WEI on 2018/2/25.
//  Copyright © 2018年 WU CHIH WEI. All rights reserved.
//

import UIKit
import MapKit

protocol StationInfo {
    
    var name: String { get }
    
    var position: String { get }
    
    var remainBikes: String { get }
}

class YouBikeViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    let closureClient = ClosureClient()
    
    var delegateClient = DelegateClient()
    var anno: MKAnnotation?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let some = SomeDelegate()
        delegateClient.delegate = some
        delegateClient.loadData()
        if let station = some.stats["taipeicity"] as? YouBikeStation {
//print("\(station.remainBikes)台 點：\(station.name)  位置：\(station.position)")
            
            let annotation = makAnnotation
            closureClient.getDataFromFile(completion: annotation)
            //add annotation to map
            mapView.addAnnotation(anno!)
            
            label3.text = "剩\(station.remainBikes)台"
            label2.text = "\(station.position)"
            // add image to UILabel
            let textAttachment = NSTextAttachment()
            let image = #imageLiteral(resourceName: "icon_marker")
            textAttachment.image = image
            textAttachment.bounds = CGRect(x: 0, y: -5, width: textAttachment.image!.size.width, height: textAttachment.image!.size.height)

            let attachmentString = NSAttributedString(attachment: textAttachment)
            let completeText = NSMutableAttributedString(string: "")
            completeText.append(attachmentString)
            let  textAfterIcon = NSMutableAttributedString(string: "\(station.name)")
            completeText.append(textAfterIcon)
            label1.attributedText = completeText
            
        }
//        let manager = YouBikeManager.createManagerFromFile()
//        guard manager.stations.count > 0 else { return }
//        let station = manager.stations[0]
//        let annotation = YouBikeAnnotation(station: station)
//         mapView.addAnnotation(annotation)
//        print("勝\(station.remainBikes)台 點：\(station.name)  位置：\(station.position)")
    }
    
    func makAnnotation(anno: MKAnnotation) -> Void {
        self.anno = anno
    }
}
