//
//  expendModel.swift
//  HMW1ExpendCalc
//
//  Created by Michael Zarate on 9/11/15.
//  Copyright (c) 2015 Michael Zarate. All rights reserved.
//

import Foundation

class expendModel
{
    var foodTotal : Double = 0
    var transTotal : Double = 0
    var houseTotal : Double = 0
    var otherTotal : Double = 0
    
    var absoluteTotal: Double = 0
    
    var foodPrecentage: Double = 0
    var transPrecentage: Double = 0
    var housePrecentage: Double = 0
    var otherPrecentage: Double = 0
    
    
    func addFood(food : Double) -> Double
    {
        foodTotal += food
        
        return foodTotal
        
    }
    func addTrans(trans : Double) ->Double
    {
        transTotal += trans
        return transTotal
    }
    
    func addHouseItem(houseItem : Double)->Double
    {
        houseTotal += houseItem
        return houseTotal
    }
    func addOtherTotal(otherItem : Double)->Double
    {
        otherTotal += otherItem
        return otherTotal
    }
    
    func calcAbosulteTotal(food : Double, trans : Double , house : Double, other : Double)-> Double
    {
        absoluteTotal = food + trans + house + other
        
        return absoluteTotal
        
    }
    
    
    func foodPercent()->Double
    {
        var total = calcAbosulteTotal(foodTotal, trans: transTotal, house: houseTotal, other: otherTotal)
        
        foodPrecentage = foodTotal / total
        
        return foodPrecentage
        
        
    }
    
    func transPercent()->Double
    {
        var total = calcAbosulteTotal(foodTotal, trans: transTotal, house: houseTotal, other: otherTotal)
        
        transPrecentage = transTotal / total
        
        return transPrecentage
    }
    
    
    
    
    func housePercent()->Double
    {
        var total = calcAbosulteTotal(foodTotal, trans: transTotal, house: houseTotal, other: otherTotal)
        
        housePrecentage = houseTotal / total
        
        return housePrecentage
        
    }
    
    
    func otherPercent()->Double
    {
        var total = calcAbosulteTotal(foodTotal, trans: transTotal, house: houseTotal, other: otherTotal)
        
        otherPrecentage = otherTotal / total
        
        return otherPrecentage
        
    }
    
    func valuesReset()
    {
     
        foodTotal = 0
        transTotal  = 0
        houseTotal  = 0
        otherTotal  = 0
        
        absoluteTotal = 0
        
        foodPrecentage = 0
        transPrecentage = 0
        housePrecentage = 0
        otherPrecentage = 0
        
        
        
    }
    
    
    
    
    
    
    
    
}
