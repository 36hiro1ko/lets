module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
    base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
 def unread(current_user)
   @unread = Message.where("post_to_id = ?",current_user.id) if signed_in?
   unread=@unread.where(read_flg: 0).count
 end
  
  
end
