module Public::NotificationsHelper
  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_post
      pet_post_path(notification.subject.pet_post, anchor: "comment-#{notification.subject.id}")
    when :sighting_to_own_post
      pet_post_path(notification.subject.pet_post)
    end
  end
end
