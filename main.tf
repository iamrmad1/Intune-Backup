// main.tf
// 2) Create a Windows device configuration policy (example CSP)
resource "microsoft365wp_configuration_policy" "win_disable_consumer" {
  name        = "WIN - Disable Consumer Features"
  description = "Disables consumer experiences on Windows devices"
  platform    = "windows10AndLater" // platform identifiers follow Intune Graph formats
  category    = "deviceConfiguration"

  // Example OMA-URI setting (CSP). Adjust as needed for your baseline.
  settings = [
    {
      // DisableConsumerFeatures: https://docs.microsoft.com/windows/client-management/mdm/policy-csp-experience
      oma_uri  = "./Device/Vendor/MSFT/Policy/Config/Experience/AllowConsumerFeatures"
      data_type = "integer"
      value     = "0"
    }
  ]
}
