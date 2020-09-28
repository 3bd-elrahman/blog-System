class SubscribersController < ApplicationController
http_basic_authenticate_with name:'admin',password:'admin123', only:[:index]

  def index
    @subscribers= Subscriber.all
  end

  def create
  	@subscriber=Subscriber.new(subscriber_params)

    if Subscriber.exists?(email:@subscriber.email)
        redirect_to root_path alert:'this email already exist'
  	elsif @subscriber.save
  		redirect_to root_path  notice:'thanks for subscribtion'

    else
      redirect_to root_path
  	end

  end



def destroy
  @subscriber=Subscriber.find(params[:id])
 @subscriber.destroy

 redirect_to subscribers_path

end
  private

  def subscriber_params
    params.require(:subscriber).permit(:f_name,:l_name,:country,:email)
  end
end
