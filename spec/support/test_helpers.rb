module TestHelpers

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      {
        provide: "goodle_oauth2",
        uid: "10777775618149142813",
        info: {
          name: "Severus Snape",
          email: "profsnape@hogwarts.edu",
          locale: "wizard world",
          gender: "male",
          token: "ya29.GlvtA-mnI6g3bwmjaGpZaYyKo5GhMkm8yNaGjL1NmjO5LgPv1dprnLdxMIFnBZTFqyMivfbLoyz3ipcdShXK5n68GqIIL5feWayPJFs11zcQrWCgaJDgVMqfPdu-",
          image: "https://s-media-cache-ak0.pinimg.com/originals/b7/38/f1/b738f16e69459d18b8086cf700a85bb4.jpg"
        }
      }
    )
  end
  
  def stub_login_user(user)
    page.set_rack_session(user_id: user.id)
  end

end
