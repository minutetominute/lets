class Confirmation
  belongs_to :offerer
  belongs_to :requester
  belongs_to :service_transaction

  after_commit :send_confirm_event!

  private

  def send_confirm_event!
    service_transaction.confirmation_added!
  end
end
