//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    //permite fechar o teclado do telefone?
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) //Finaliza a escrita no textfield
        return true //permite aqui...
    }
    
    //permite a finalizacao do textfield ? Aceita o clique do ok do teclado?
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true //se nao for vazio, ok
        }else{
            textField.placeholder = "Digite o nome da cidade"
            return false //se for vazio, coloca um alerta e nada faz...
        }
    }
    
    //acao executada ao finalizar o textfield ...
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let cityName = textField.text {
            weatherManager.fetchWeather(cityName: cityName)
        }
        searchTextField.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureStting
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
    }
    
    func didiFailWithError(error: Error) {
        print(error)
    }
    
}

