class HomeController < ApplicationController
  def index; end

  def forward_message
    if params[:name].empty? || params[:email].empty? || params[:message].empty?
      return redirect_to root_path, alert: 'Please fill all values'
    end

    message_data = {
      form: {
        name: params[:name],
        email: params[:email],
        message: params[:message]
      }
    }

    url = 'https://monroneylabels.com/pages/dealer_message.json'

    response = RestClient.post url, message_data

    return redirect_to root_path, notice: 'Message sent successfully' if response.code == 200

    redirect_to root_path, alert: 'Some error occured'
  end
end
