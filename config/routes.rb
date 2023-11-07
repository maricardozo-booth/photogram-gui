Rails.application.routes.draw do

  get("/", { :controller => "user", :action => "index" })

  get("/users", { :controller => "user", :action => "index" })
  post("/add_user", { :controller => "user", :action => "insert" })
  post("/update_user/:path_id", { :controller => "user", :action => "update" })
  get("/users/:path_id", { :controller => "user", :action => "show" })
  get("/delete_user/:path_id", { :controller => "user", :action => "destroy" })

  get("/photos", { :controller => "photo", :action => "index" })
  post("/insert_photo_record", { :controller => "photo", :action => "insert" })
  post("/update_photo/:path_id", { :controller => "photo", :action => "update" })
  get("/photos/:path_id", { :controller => "photo", :action => "show" })
  get("/delete_photo/:path_id", { :controller => "photo", :action => "destroy" })
  post("/add_comment", { :controller => "photo", :action => "comment" })

end
