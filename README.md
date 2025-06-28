# SimpleCaptchaGuard

A simple CAPTCHA gem for Rails to prevent bots from submitting forms.

- ImageMagick needs to be installed in your system

## Usage

Add `captcha_tag` in your form. Here is a simple code example:
```
  <%= captcha_tag %></br>Enter captcha : 
  <%= text_field_tag :captcha_input %></br></br>
```

and `verify_captcha(params[:captcha_input])` in your controller. Here is a sample code example:
```
  # POST /inquiries or /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    if verify_captcha(params[:captcha_input])
      respond_to do |format|
        if @inquiry.save
          format.html { redirect_to @inquiry, notice: "Inquiry was successfully created." }
          format.json { render :show, status: :created, location: @inquiry }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @inquiry.errors, status: :unprocessable_entity }
        end
      end
    else
        flash[:alert] = "CAPTCHA failed. Please try again."
        redirect_to new_inquiry_path
    end
  end
```
