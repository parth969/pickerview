//
//  ViewController.swift
//  pickerview
//
//  Created by COE-026 on 04/09/19.
//  Copyright © 2019 COE-026. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var countrylist = [CountryClass]()
    var statelist = [StateClass]()
    var citylist = [CityClass]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return countrylist.count
        
        }
        else if component == 1{
            return selectedstates.count
        }
        else if component == 2{
            return selectedcities.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return countrylist[row].countryname
        }
        else if component == 1 {
            return selectedstates[row].statename
        }
        else if component == 2{
            return selectedcities[row].cityname
        }
        return ""
    }
    
    var selectedstates = [StateClass]()
    var selectedcities = [CityClass]()
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            selectedstates = statelist.filter({ (stateObj) -> Bool in
                if stateObj.referencecountryid == countrylist[row].countryid{
                    return true
                }
                return false
            })
            pickerView.reloadComponent(1)
        }
        else if component == 1{
            selectedcities = citylist.filter({ (cityObj) -> Bool in
                if cityObj.referencestateid == statelist[row].stateid{
                    return true
                }
                return false
            })
            pickerView.reloadComponent(2)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var country = CountryClass()
        country.countryid = 1
        country.countryname = "India"
        countrylist.append(country)
        
        country.countryid = 2
        country.countryname = "America"
        countrylist.append(country)
        
        var state = StateClass()
        state.referencecountryid = 1
        state.stateid = 1
        state.statename = "Gujarat"
        statelist.append(state)
        
        state.referencecountryid = 2
        state.stateid = 2
        state.statename = "Los santos"
        statelist.append(state)
        
        var city = CityClass()
        city.referencestateid = 1
        city.cityid = 3
        city.cityname = "Gandhinagar"
        citylist.append(city)
        
        city.referencestateid = 2
        city.cityid = 4
        city.cityname = "Boston"
        citylist.append(city)
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

