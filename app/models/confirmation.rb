class Confirmation < ActiveRecord::Base
  belongs_to :offerer, optional: true
  belongs_to :requester, optional: true
  belongs_to :service_transaction

  after_commit :send_confirm_event!

  private

  def send_confirm_event!
    service_transaction.confirmation_added!
  end
end
