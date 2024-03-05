class NotifyWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user)
    UserMailer.notify_email(user).deliver_now
  end
end
