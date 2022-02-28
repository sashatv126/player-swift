//
//  PlayViewController.swift
//  FirstProject
//
//  Created by Владимир on 22.02.2022.
//

import UIKit
import MediaPlayer
import SnapKit
class PlayViewController: UIViewController {
//MARK: -Properties
   var player : AVPlayer!
   var name : String
//MARK: -Init
    init(name:String){
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("No data about music")
    }
//MARK: -Views
    lazy var scrollView : UIScrollView = {
       let scrollView = UIScrollView()
        return scrollView
    }()
    lazy var slideBar : UISlider = {
        let slider = UISlider()
        slider.addAction(UIAction(handler: {[weak self] _ in self?.player.seek(to: CMTime(seconds: Double(slider.value), preferredTimescale: 10000))}), for: .allEvents)
        return slider
    }()
    
    
    lazy var buttonOfPlay : UIButton = {
        let button = UIButton(type: .system, primaryAction: nil)
        button.tintColor = .black
        button.setImage(Constants.Image.play, for : .normal )
        button.addTarget(.none, action: #selector(buttonPlayTapped), for: .touchUpInside)
        return button
    }()
    lazy var labelOfName : UILabel = {
        let label = UILabel()
         label.textColor = .black
        label.text = "efowefjoiw"
         label.numberOfLines = 0
         label.font = Constants.Fonts.font1
         return label
    }()
    lazy var imageOfCover : UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image = UIImageView(image: Constants.Image.contentBlock)
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "1", ofType: "mp3")!))
        slideBar.maximumValue = Float(player.currentItem?.asset.duration.seconds ?? 0)
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) {(time) in
            self.slideBar.value = Float(time.seconds)
        }
//MARK: -Public methods
    }
    func configure(_ array : [CellOfMusicViewModel],number : Int) {
    }
//MARK: -Private methods
    private func setupConstraints() {
        scrollView.snp.makeConstraints{maker in
            maker.left.right.equalToSuperview()
            maker.top.bottom.equalToSuperview()
        }
        imageOfCover.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(scrollView).inset(50)
            maker.height.equalTo(300)
            maker.width.equalTo(300)
        }
        labelOfName.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(imageOfCover).inset(350)
            maker.height.equalTo(30)
        }
        buttonOfPlay.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(labelOfName).inset(70)
            maker.height.equalTo(50)
            maker.width.equalTo(50)
        }
        slideBar.snp.makeConstraints{maker in
            maker.centerX.equalTo(scrollView)
            maker.top.equalTo(buttonOfPlay).inset(50)
            maker.height.equalTo(40)
            maker.width.equalTo(200)
        }
    }
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(labelOfName)
        scrollView.addSubview(buttonOfPlay)
        scrollView.addSubview(imageOfCover)
        scrollView.addSubview(slideBar)
    }
    @objc private func buttonPlayTapped() {
        if player.timeControlStatus == .playing {
            buttonOfPlay.setImage(Constants.Image.play, for: .normal)
            player.pause()
        } else {
            buttonOfPlay.setImage(Constants.Image.pause, for: .normal)
            player.play()
        }
        
    }
}
