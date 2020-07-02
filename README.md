# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
Tên của hàm trong controller phải trùng tên với file view
<%  %> thực thi mã bên trong
<%= %> thực thi mã bên trong và insert dữ liệu vào file html.erb

*Một số lệnh thú vị:
1. Đổi tên miền trên heroku "heroku rename tencandoi"
2. Tạo 1 model đầy đủ "rails generate scaffort User"
3. Tạo 1 controlller + view : "rails generate controller User"
4. Tạo 1 model : "rails generate model User name:string email:string"
4. Để huỷ thì thay "generate" bằng "destroy"
5. Tải 1 file vào 1 thư mục :"curl -o app/assets/images/rails.png -OL railstutorial.org/rails.png"
6. Tạo 1 file tào thư mục : "touch app/assets/stylesheets/custom.scss"
7. Tạo layout link tests :"rails generate integration_test site_layout"

*Một số lưu ý khi chuyển trang trong Rails
1. Muốn sử dụng path cần khai báo ở trong file routes.rb như sau 
    get '/help', to:'static_pages#help'
Như vậy đường dẫn sẽ là "help_path"
    get '/help', to:'static_pages#help', as 'helf'
Như vậy đường dẫn sẽ là "helf_path" 
    get 'static_pages/help'
Như vậy đường dẫn sẽ là "static_pages_help_url"

*Chú ý khi tạo mới 1 đối tượng và gán thì cần phải user.save

*Đánh index cho cột : "rails generate migration add_index_to_users_email" sau đó gọi "rails db:migrate
" để thay đổi
