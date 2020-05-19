import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain();

    override func viewDidLoad() {
        storyLabel.numberOfLines = 0
        super.viewDidLoad()
        updateQuestion(0)
    }
    
    @IBAction func choice1Made(_ sender: UIButton) {
        storyBrain.nextStory(1)
        animateButtonTouch(sender)
        updateQuestion(storyBrain.storyTrack)
    }
    
    @IBAction func choice2Made(_ sender: UIButton) {
        storyBrain.nextStory(2)
        animateButtonTouch(sender)
        updateQuestion(storyBrain.storyTrack)
    }
    func updateQuestion(_ count: Int){
        storyLabel.text = storyBrain.story[count].title;
        choice1Button.setTitle(storyBrain.story[count].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.story[count].choice2, for: .normal)
    }
    
    func animateButtonTouch(_ sender: UIButton){
        UIButton.animate(withDuration: 0.2,
        animations: {
        sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)},
        completion: { finish in
        UIButton.animate(withDuration: 0.2, animations: {
        sender.transform = CGAffineTransform.identity})})
    }
}

