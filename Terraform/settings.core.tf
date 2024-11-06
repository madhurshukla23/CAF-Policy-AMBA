# Configure the custom landing zones to deploy in
# addition to the core resource hierarchy
locals {
  custom_landing_zones = {
    "${var.root_id}" = {
      display_name               = "${var.root_id}"
      parent_management_group_id = "data.azurerm_client_config.current.tenant_id"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "es_root"
        parameters = {
          Alerting-ServiceHealth = {
            ALZMonitorResourceGroupName     = ""
            ALZMonitorResourceGroupLocation = ""
            ALZLogicappResourceId           = "/subscriptions/123456789/resourceGroups/<rg-name>/providers/Microsoft.Logic/workflows/<logic-name>"
            ALZLogicappCallbackUrl          = ""
          },
          Notification-Assets = {
            ALZMonitorResourceGroupLocation = ""
            ALZMonitorResourceGroupName     = ""
            ALZLogicappResourceId           = "/subscriptions/123456789/resourceGroups/<rg-name>/providers/Microsoft.Logic/workflows/<logic-name>"
            ALZLogicappCallbackUrl          = ""
          }
        }
        access_control = {}
      }
    }
    "Platform" = {
      display_name               = "Platform"
      parent_management_group_id = "${var.root_id}"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_platform"
        parameters     = {}
        access_control = {}
      }
    },
    "Connectivity" = {
      display_name               = "Connectivity"
      parent_management_group_id = "${var.root_id}.Platform.Connectivity"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "es_connectivity"
        parameters = {
          Alerting-Connectivity = {
            alzMonitorResourceGroupLocation = "",
            alzMonitorResourceGroupName     = ""
          }
        }
        access_control = {}
      }
    },
    "Identity" = {
      display_name               = "Identity"
      parent_management_group_id = "${var.root_id}.Platform.Identity"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "es_identity"
        parameters = {
          Alerting-Identity = {
            alzMonitorResourceGroupLocation = "",
            alzMonitorResourceGroupName     = ""
          }
        }
        access_control = {}
      }
    },
    "Management" = {
      display_name               = "Management"
      parent_management_group_id = "${var.root_id}.Platform.Management"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "es_management"
        parameters = {
          Alerting-Management = {
            alzMonitorResourceGroupLocation = "",
            alzMonitorResourceGroupName     = ""
          }
        }
        access_control = {}
      }
    },
    "LandingZones" = {
      display_name               = "LandingZones"
      parent_management_group_id = "${var.root_id}.LandingZones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "es_landing_zones"
        parameters = {
          Alerting-LandingZone = {
            alzMonitorResourceGroupLocation = "",
            alzMonitorResourceGroupName     = ""
          }
        }
        access_control = {}
      }
    },
    "Corp" = {
      display_name               = "Corp"
      parent_management_group_id = "${var.root_id}.LandingZones.Corp"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_corp"
        parameters     = {}
        access_control = {}
      }
    },
    "Online" = {
      display_name               = "Online"
      parent_management_group_id = "${var.root_id}.LandingZones.Online"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_online"
        parameters     = {}
        access_control = {}
      }
    },
    "Decommisioned" = {
      display_name               = "Decommisioned"
      parent_management_group_id = "${var.root_id}.LandingZones.Decommisioned"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_decommissioned"
        parameters     = {}
        access_control = {}
      }
    },
    "Sandbox" = {
      display_name               = "Sandbox"
      parent_management_group_id = "${var.root_id}.LandingZones.Sandbox"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "es_sandboxes"
        parameters     = {}
        access_control = {}
      }
    }
  }
}
