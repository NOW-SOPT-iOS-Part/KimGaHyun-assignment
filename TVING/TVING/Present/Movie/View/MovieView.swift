//
//  MovieView.swift
//  TVING
//
//  Created by Gahyun Kim on 2024/04/30.
//

import UIKit

import SnapKit
import Then

// 선택한 날짜 데이터 전달
protocol MovieViewDelegate: AnyObject {
    func didSelectDate(_ date: String)
}

final class MovieView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: MovieViewDelegate?
    private var dailyBoxOfficeList: [MovieDTO] = [] {
        didSet {
            movieTableView.reloadData()
        }
    }
    
    // MARK: - UI Components
    
    private let datePicker = UIDatePicker()
    let movieTableView = UITableView()
    let headerCollectionView = TopCollectionView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension MovieView {
    func setupStyle() {
        self.backgroundColor = .tvingGray2
        
        datePicker.do {
            $0.maximumDate = Date().addingTimeInterval(-86400) //최대 날짜를 어제로 설정
            $0.tintColor = .tvingRed
            $0.preferredDatePickerStyle = .inline
            $0.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        }
        movieTableView.do {
            $0.backgroundColor = .red
            $0.frame = CGRect.init(x: 0, y: 200, width: Int(self.frame.width), height: 200)
        }
    }
    
    func setupHierarchy() {
        addSubviews(datePicker, movieTableView, headerCollectionView)
    }
    
    func setupLayout() {
        datePicker.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.horizontalEdges.equalToSuperview().inset(30)
            $0.width.equalTo(100)
            $0.height.equalTo(420)
        }
        
        movieTableView.snp.makeConstraints {
            $0.top.equalTo(datePicker.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
        
        headerCollectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(32)
        }
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let selectedDate = dateFormatter.string(from: sender.date)
        delegate?.didSelectDate(selectedDate)
    }
}

extension MovieView {
    func databind(_ data: [MovieDTO]) {
        dailyBoxOfficeList = data
    }
}
