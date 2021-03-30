class ApplicationController < ActionController::API
    
    #Allows us to create a token when signed-up or loggedin
    def encode_token(payload)
        JWT.encode payload, ENV['JWT_SECRET']
    end

    #Authorization Header will allways have the token
    def auth_header
        request.headers['Authorization']
    end

    #Allows us to decode the header
    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, ENV['JWT_SECRET'])[0]
            rescue JWT::DecodeError
                nil
            end
        end
    end

    #Finds user id from the decoded token
    def current_user
        byebug
        if decoded_token
            user_id = decoded_token["user_id"]
            @user = User.find_by(id: user_id)
        end
    end

    #Is there a current user
    def logged_in?
        !!current_user
    end

    #sends a message unless we have a decoded token
    def authorized
        render json: {error: "These are not the beers you are looking for"}, status: :unauthorized unless logged_in?
    end
end
