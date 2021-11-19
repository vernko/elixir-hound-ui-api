defmodule UserApiTest do
    # Import helpers
    use Hound.Helpers
    use ExUnit.Case

    @tag :api_test
    @tag :single
    test "Single User" do
      body = "{\"data\":{\"id\":2,\"email\":\"janet.weaver@reqres.in\",\"first_name\":\"Janet\",\"last_name\":\"Weaver\",\"avatar\":\"https://reqres.in/img/faces/2-image.jpg\"},\"support\":{\"url\":\"https://reqres.in/#support-heading\",\"text\":\"To keep ReqRes free, contributions towards server costs are appreciated!\"}}"
      resp = HTTPoison.get!("https://reqres.in/api/users/2")
      assert resp.status_code == 200
      assert body == resp.body
    end

    @tag :api_test
    @tag :not_found
    test "Single User Not Found" do
      body = "{}"
      resp = HTTPoison.get!("https://reqres.in/api/users/23")
      assert resp.status_code == 404
      assert body == resp.body
    end

    @tag :api_test
    @tag :post
    test "Create User" do
      body = '{
        "name": "goku",
        "job": "protector"
      }'
      resp = HTTPoison.post!("https://reqres.in/api/users", body)
      assert resp.status_code == 201
    end

    @tag :api_test
    @tag :update
    test "Update User" do
      body = '{
        "name": "vegeta",
        "job": "destroyer"
      }'
      resp = HTTPoison.put!("https://reqres.in/api/users/2", body)
      assert resp.status_code == 200
    end
end
