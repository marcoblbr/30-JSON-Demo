//
//  ViewController.swift
//  30 - JSON Demo
//
//  Created by Marco Linhares on 8/2/15.
//  Copyright (c) 2015 Marco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlPath = "http://www.telize.com/geoip"
        
        var url = NSURL (string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
        // o conteúdo de dentro do task é executado quando a url é lida. São retornadas 3 variáveis, data, response e error que podem ser tratadas dentro da função.
        let task = session.dataTaskWithURL (url!, completionHandler: {
            (data, response, error) -> Void in
            
            if error != nil {
                println (error)
            } else {
                // converte os dados em um dicionário (jsons são dicionários)
                let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                
                // lê uma url do disco e mostra em código html
                println (jsonResult)
                println (jsonResult ["country_code"]!)
            }
        })
        
        // o comando abaixo executa a declaração acima
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

/*
    
Exemplo de JSON:

{"longitude":-47.0833,"latitude":-22.9,"asn":"AS28573","offset":"-3","ip":"187.64.234.97","area_code":"0","continent_code":"SA","dma_code":"0","city":"Campinas","timezone":"America\/Sao_Paulo","region":"Sao Paulo","country_code":"BR","isp":"Serviços de Comunicação S.A.","country":"Brazil","country_code3":"BRA","region_code":"27"}
*/

}

