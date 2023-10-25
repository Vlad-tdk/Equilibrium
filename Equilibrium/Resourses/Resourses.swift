//
//  Resourses.swift
//  Equilibrium
//
//  Created by Vlad on 11.9.23..
//
import UIKit
import Foundation

enum Resourses{
    enum Colors {
        static let backgroundColorCell = UIColor(hexString: "#bfd4ad")
        static let backgroundColorMain = UIColor(hexString: "#e3e1b8")
        static let colorFontCell = UIColor(hexString: "597824")
    }
    enum UserAction: String, CaseIterable {
        case breath = "Breathing Training"
        case mandala = "Mandala Meditation"
        case showImage = "Calming Pictures"
        case fireGif = "Fire medittation"
        case about = "About App"
        
    }
    enum Images {
        static let imagesMain = ["Breath", "m2", "image", "fire", "about"]
        static let mandalaImages = [
            "m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8", "m9", "m10",
            "m11", "m12", "m13", "m14", "m15"
                                      ]
        static let images = ["1","2","6","7","8","9","10","11", "12", "13", "14", "15", "16", "17",
                                 "18", "19", "20", "21","22","27","34","35","54","77","81","83"]
        static let gifImages = ["sv", "sv2", "cos"]
    }
    enum Sound {
        static let forest = "soundsOfTheForest.mp3"
        static let fire = "fire.mp3"
    }
    
    enum Description {
        static let titleMandala = "Mandala Meditation"
        static let messageMandala = """
Mandala meditation balances the emotional state and allows you to work purposefully.
Mandala is a geometric symbol of complex structure, which is interpreted as a model of the Universe, a "map of the cosmos".\
The symbol embedded in the mandala activates the inner energies and shifts attention from the outside world to the inner space.
1. Choose a mandala. Trust your intuition and mood.\
2. Create a formula for your intention. The final result of the practice depends on how clear and convincing your intention is. Here are some attitudes you can use: "I want to know myself"; "I want to find a solution to a problem"; "I want to have a good rest".\
3. Look at the mandala. Feel the reality of the image, feel the color, shape, structure, establish a connection with it.\
4. Be prepared for various visual effects to appear during contemplation. visual effects. They are very individual. For example, the appearance of volume in the image, darkening of the drawing at the edges and bright clarification in the center. There may also be a sense of movement. The appearance of these effects is indicative a transition into an altered state of consciousness.
5. Begin to look at the center of the mandala. This will bring you back to the center of your own self, the source of peace and balance.\
6. Your task is to achieve a state when you do not think about anything, but just sit and contemplate the movement - the pulsation of the mandala. At this moment, the symbolic reality opens up for you, a magical moment called "now. \
7. After looking at the mandala for a few minutes, close your eyes. Try to see the mandala with your inner vision. After meditation you will feel a surge of strength, inspiration, freshness of thoughts and desire to act.\

Tap in the center of the screen to start
"""
        static let titleFire = "Meditation on Fire"
        static let messageFire = """
        Meditating on fire carries with it
        a powerful cleansing effect.
        1. Close your eyes, equalize your breathing and relax.
        2. Direct your gaze to the flame candle flame and focus all of your
        attention. Look at the center of the flame, where it is brightest and strongest.
        3. Visualize yourself being consumed by the fire. It fills the body, cleansing and soothing. All worries and anxieties and worries. Feel how it destroys negative energy.
        4. If your eyes are watering, close them your eyes for a while, and then
        then open them and continue meditation.
        5. Keeping the image of the candle, close your eyes and try to
        to feel the fire in the heart, in the thoracic chakra. Feel the light and warmth fill your whole body.
        6. After finishing the meditation, open your eyes and exhale deeply. Also.
        slowly and deeply inhale and return to your normal state.
        With proper meditation. you will feel cleansed of of negative energies, clarity consciousness and warmth in your heart.
        Your energy level will increase.
"""
    }
}
