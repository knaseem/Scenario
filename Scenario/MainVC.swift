//
//  MainVC.swift
//  Scenario
//
//  Created by Khalid Naseem on 16/07/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

import UIKit

import AVFoundation

class MainVC: UIViewController, AVAudioPlayerDelegate {
    
    //MARK: create audioPlayer variable
    
    var audioPlayer : AVAudioPlayer?

    @IBOutlet weak var Label: UILabel!
    
    let whatIfArray = [
        "What if you only had one sense, what would it be?",
        "What would be your super-power?",
        "What if you could cure anything, what would it be?",
        "What if you could be any animal, which would you choose?",
        "What if you could be rich and miserable or poor and happy, your decision?",
        "If you had one wish, what would it be?",
        "If you could change one thing in the world what would it be?",
        "What if you could suddenly possess an extraorinary talent?",
        "If you could have chosen your first name what would it have been?",
        "If you had to convert to a different religion, which would you choose?",
        "If you had to be homeless for a year where would you stay?",
        "If you could only see one movie ever again which one would it be?",
        "What if you could commit one crime without being caught, what would it be?",
        "If you could unknow one thing you know what would it be?",
        "What if you had to lose a limb, which one would go?",
        "What if you could choose the way you die, how would you go?",
        "If you could have an endless supply of any food, what would you get?",
        "If you were an animal, what would you be and why?",
        "What is one goal you'd like to accomplish during your lifetime?",
        "When you were little, who was your favorite super hero and why?",
        "What's your favorite thing to do in the summer?",
        "If you made a movie of your life, what would it be about and which actor actor would yo want to play out?",
        "What if you were an ice cream flavor, which one would you be and why?",
        "What's your favorite cartoon character, and why?",
        "If you could visit any place in the world, where would you choose to go and why?",
        "What's the ideal dream job for you?",
        "Are you a morning or a night person?",
        "What is your favorite hobby?",
        "What's the weirdest thing you've ever eaten?",
        "Name one of your favorite things about someone in your family.",
        "If you had to describe yourself using three words, it would be..",
        "If someone made a movie of your life would it be a drama, a comedy, a romantic-comedy, action film, or science fiction.",
        "You can choose your last meal. What will the menu consist of?",
        "List 5 people you know. Then describe each of them in 3 words.",
        "If you could be any age again for one week, what age would you be?",
        "Have you ever returned an item to a store for a refund after having used it?",
        "Which emoji is more crucial to your life? 😂 or 😒",
        "What's more important, truth or happiness?",
        "If you go to a restaurant and have terrible service, is it ever OK not to tip?",
        "If you could go to any college, regardless of cost or location, where would you go?",
        "If you were to name one piece of clothing that describes you, what would you say?",
        "If money were no object, where would you like to go on vacation?",
        "What countries have you travelled to?",
        "If you were handed free concert tickets, would you go or sell them? Why?",
        "What is the best gift anyone's ever given to you?",
        "If you could spend 15 minutes with any living person, who would it be and why?",
        "f you won a million dollars, what would you do with it?",
        "If you could be invisible for a day, what would you do?",
        "If you were to be on a reality TV show which one would you be on and why?",
        "If you could go only to one restaurant for the next five years, which would it be?",
        "If you could be any kitchen appliance, what would it be and why?",
        "Say one nice compliment about someone in this room.",
        "If you had a magic lamp and a genie who granted you three wishes, what would the three wishes be?",
        "If you could have a celebrity entourage with three celebrities, who would they be?",
        "If you could go back and change your career path what would you be doing now?",
        "If you could fly or you could breathe under water, what would you prefer?",
        "If you could only take three people from this group to an island, who would they be?",
        "If you could live to the age of 90 and either retain your looks or your brains that you had at age 30, which would you choose?",
        ]
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Message for user in the Label when app is launched.
        Label.text = "Press the Scenario? button or Shake your phone!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func scenarioButtonTapped(sender: AnyObject) {
        
        //MARK:  Pull out random string from whatIfArray:
        
        let random = Int(arc4random_uniform(UInt32(whatIfArray.count)))
        Label.text = whatIfArray[random]
        
        //MARK:// Play sound here
        playSound(beep)
    }
    
    //MARK: Add function for phone shake (built in function)
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        //MARK: Call scenarioButtonTapped function.
        scenarioButtonTapped(UIEvent)
    }
    
    func playSound (sound: Sound) {
        let dispatchQueue =
            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(dispatchQueue, {[weak self] in
            let mainBundle = NSBundle.mainBundle()
            
            /* Find the location of our file to feed to the audio player */
            let filePath = mainBundle.pathForResource(sound.fileName, ofType:sound.fileExtension)
            
            if let path = filePath{
                let fileData = NSData(contentsOfFile: path)
                
                var error:NSError?
                
                do {
                    /* Start the audio player */
                    self!.audioPlayer = try AVAudioPlayer(data: fileData!)
                } catch let error1 as NSError {
                    error = error1
                    self!.audioPlayer = nil
                } catch {
                    fatalError()
                }
                
                /* Did we get an instance of AVAudioPlayer? */
                if let player = self!.audioPlayer {
                    /* Set the delegate and start playing */
                    player.delegate = self
                    if player.prepareToPlay() && player.play(){
                        /* Successfully started playing */
                    } else {
                        /* Failed to play */
                    }
                } else {
                    /* Failed to instantiate AVAudioPlayer */
                }
            }
            
            })
    }


}

