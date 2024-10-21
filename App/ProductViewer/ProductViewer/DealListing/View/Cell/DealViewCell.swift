//
//  Copyright © 2022 Target. All rights reserved.
//

import UIKit

final class DealViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: DealViewCell.self)

    private lazy var listItemView: DealView = {
        let view = DealView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
  
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setupConstraints() {
        contentView.addSubview(listItemView)
        listItemView.pinToSuperView()
    }
    
    func configure(_ viewModel: DealViewModel?, _ imageProvider: ImageProviderProtocol) {
        guard let viewModel = viewModel else {
            return
        }
        listItemView.configure(viewModel, imageProvider)
    }
}
