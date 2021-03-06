class ViewFragmentCell < Cell::Rails
  def show(board, name)
    if view = ViewFragment.where(board:board, name:name).first
      render html: view.content.html_safe
    else
      nil
    end
  end
end
