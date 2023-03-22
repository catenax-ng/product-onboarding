# Explanation for the structure and variables we provide for terraform scripts
#
# Structure of Github Teams resolve <variable> with namingpattern
# github_teams = {
#    "<new-team-object>" : {
#      "name" : "<new-team-name>",
#      "description" : "<new-gh-team-description>"
#    },
#}
#
# Structure of Github Repostitorys resolve <variable> with namingpattern
#github_repositories = {
#  "<new-team-repository-object>" : {
#    name : "<new-repository-name>"
#    team_name : ""
#    description : ""
#    visibility : "public"
#    has_issues = false
#    homepage_url : ""
#    topics : []
#    pages : {
#      enabled : false
#      branch : ""
#    }
#    is_template : false
#    uses_template : false
#    template : {
#      owner : "catenax-ng"
#      repository : "<new-team-repository-template-if-needed>"
#    }
#    codeowners_available : false
#    codeowners : null
#  }
#}
#
# Structure of Github Repostitory / Github Team mapping resolve <variable> with namingpattern
#github_repositories_teams = {
#  # pattern "<new-repository-name>-<new-team-name>"
#  "playground-target-argocdadmins" : {
#    team_name : "<new-team-name>"
#    repository : "<new-repository-name>"
#    permission : "maintain" # default should "maintain" execpt some special permission is needed
#  }
#}

github_teams = {
  "argocdadmins" : {
    "name" : "argocdadmins",
    "description" : "ArgoCD OAuth administrator team"
  },
  "product-puris" : {
    "name" : "product-puris",
    "description" : "Product Team PURIS"
  },
  "cx-core-schemas" : {
    "name" : "cx-core-schemas",
    "description" : ""
  },
  "product-behaviour-twin-pilot" : {
    "name" : "product-behaviour-twin-pilot",
    "description" : ""
  },
  "product-bpdm" : {
    "name" : "product-bpdm",
    "description" : ""
  },
  "product-catenax-at-home" : {
    "name" : "product-catenax-at-home",
    "description" : ""
  },
  "product-standardization" : {
    "name" : "product-standardization",
    "description" : ""
  },
  "product-data-integrity-demonstrator" : {
    "name" : "product-data-integrity-demonstrator",
    "description" : ""
  },
  "product-dft" : {
    "name" : "product-dft",
    "description" : ""
  },
  "product-edc" : {
    "name" : "product-edc",
    "description" : ""
  },
  "product-esc-backbone" : {
    "name" : "product-esc-backbone",
    "description" : ""
  },
  "product-essential-services" : {
    "name" : "product-essential-services",
    "description" : ""
  },
  "product-explorer" : {
    "name" : "product-explorer",
    "description" : ""
  },
  "product-innovation-radar" : {
    "name" : "product-innovation-radar",
    "description" : ""
  },
  "product-managed-identity-wallets" : {
    "name" : "product-managed-identity-wallets",
    "description" : ""
  },
  "product-material-pass" : {
    "name" : "product-material-pass",
    "description" : ""
  },
  "product-portal" : {
    "name" : "product-portal",
    "description" : ""
  },
  "product-semantics" : {
    "name" : "product-semantics",
    "description" : ""
  },
  "product-team-example" : {
    "name" : "product-team-example",
    "description" : "this is a team for demo purpose"
  },
  "product-test-data-generator" : {
    "name" : "product-test-data-generator",
    "description" : ""
  },
  "product-traceability-foss" : {
    "name" : "product-traceability-foss",
    "description" : ""
  },
  "product-traceability-irs" : {
    "name" : "product-traceability-irs",
    "description" : ""
  },
  "product-value-added-service" : {
    "name" : "product-value-added-service",
    "description" : ""
  },
  "team-foss" : {
    "name" : "team-foss",
    "description" : "Free open source software - Catena-X mentors"
  },
  "team-hello-gitops" : {
    "name" : "team-hello-gitops",
    "description" : "only Burak"
  },
  "team-security" : {
    "name" : "team-security",
    "description" : ""
  },
  "product-knowledge" : {
    "name" : "product-knowledge"
    "description" : "Catena-X Knowledge Agents delivers a semantically-driven and state-of-the-art compute-to-data architecture for automotive use cases based on the best GAIA-X, W3C and Big Data practices. Team Discussions: catenax-ng/product-knowledge"
  },
  "release-management" : {
    name : "release-management"
    description : "Members will be granted permissions to manage releases on release relevant environments"
  },
  "test-management" : {
    name : "test-management"
    description : "Members will be granted permissions to manage deployments on integration environments for testing purposes"
  },
  "beta-admins" : {
    name : "beta-admins"
    description : "Members will be granted admin permissions for beta environment"
  },
  "product-registry-twin-check" : {
    name : "product-registry-twin-check"
    description : ""
  },
  "product-business-partner-certificates" : {
    name : "product-business-partner-certificates"
    description : ""
  },
  "product-et-demonstrators" : {
    name : "product-et-demonstrators"
    description : ""
  },
  "product-item-relationship-service-frontend" : {
    name : "product-item-relationship-service-frontend"
    description : ""
  },
  "product-r-strategy-assistant" : {
    name : "product-r-strategy-assistant"
    description : ""
  },
  "traceability-spec" : {
    name: "traceability-spec"
    description: "Content team for Traceability KIT documentation"
  }
}

github_repositories = {
  "product-puris-backend" : {
    name : "product-puris-backend"
    team_name : "product-puris"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : {
      owner : "catenax-ng"
      repository : "k8s-helm-example"
    }
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-puris-frontend" : {
    name : "product-puris-frontend"
    team_name : "product-puris"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : {
      owner : "catenax-ng"
      repository : "k8s-helm-example"
    }
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-bpdm" : {
    name : "product-bpdm"
    team_name : "product-bpdm"
    description : "DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : ["archived", "deprecated", "obsolete"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-idses-frontend-apps" : {
    name : "product-idses-frontend-apps"
    team_name : "product-essential-services"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-innovation-radar" : {
    name : "product-innovation-radar"
    team_name : "product-innovation-radar"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-semantics" : {
    name : "product-semantics"
    team_name : "product-semantics"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-frontend" : {
    name : "product-portal-frontend"
    team_name : "product-portal"
    description : "Catena-X Portal Frontend - DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : "https://portal.dev.demo.catena-x.net"
    topics : ["catena-x", "docker", "portal", "react", "typescript"]
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-iam" : {
    name : "product-portal-iam"
    team_name : "product-portal"
    description : "Catena-X IAM - Keycloak instances - DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : [
      "catena-x",
      "identity-and-access-management",
      "keycloak"
    ]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-backend" : {
    name : "product-portal-backend"
    team_name : "product-portal"
    description : "Catena-X Portal Backend - DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : [
      "backend",
      "catena-x",
      "portal"
    ]
    pages : {
      enabled : true
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-data-integrity-demonstrator" : {
    name : "product-data-integrity-demonstrator"
    team_name : "product-data-integrity-demonstrator"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "catenax-at-home" : {
    name : "catenax-at-home",
    team_name : "product-catenax-at-home",
    description : "⚠️ Catena-X@Home and the API-Wrapper are deprecated!!",
    visibility : "public"
    has_issues = false
    homepage_url : "https://catenax-ng.github.io/docs/catenax-at-home-getting-started-guide"
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-catena-x-standardization" : {
    name : "product-catena-x-standardization",
    team_name : "product-standardization",
    description : "",
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-core-schemas" : {
    name : "product-core-schemas",
    team_name : "cx-core-schemas",
    description : "",
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-cd" : {
    name : "product-portal-cd"
    team_name : "product-portal"
    description : "Catena-X Portal - Continuous Deployment - DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : [
      "argocd",
      "catena-x",
      "continuous-deployment",
      "helm",
      "kubernetes",
      "portal"
    ]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "DataSpaceConnector" : {
    name : "DataSpaceConnector"
    team_name : "product-managed-identity-wallets"
    description : "DataspaceConnector project"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-common-assets" : {
    name : "product-portal-common-assets"
    team_name : "product-portal"
    description : "Assets used by the Catena-X Portal"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-core-managed-identity-wallets" : {
    "name" : "product-core-managed-identity-wallets"
    "team_name" : "product-managed-identity-wallets"
    "description" : "DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-dft-backend" : {
    name : "product-dft-backend"
    team_name : "product-dft"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-dft-frontend" : {
    name : "product-dft-frontend"
    team_name : "product-dft"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-sd-hub" : {
    name : "product-sd-hub"
    team_name : "product-essential-services"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-omejdn-server" : {
    name : "product-omejdn-server"
    team_name : "product-essential-services"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-DAPS" : {
    name : "product-DAPS"
    team_name : "product-essential-services"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-item-relationship-service" : {
    name : "product-item-relationship-service"
    team_name : "product-traceability-irs"
    description : "DEPRECATED - use https://github.com/catenax-ng/tx-item-relationship-service"
    visibility : "public"
    has_issues = false
    homepage_url : "https://catenax-ng.github.io/product-item-relationship-service/docs/"
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "product-testdata-2-edc" : {
    name : "product-testdata-2-edc"
    team_name : "product-data-integrity-demonstrator"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-esc-backbone" : {
    name : "product-esc-backbone"
    team_name : "product-esc-backbone"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : "https://argo.dev.demo.catena-x.net/"
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : true
    codeowners : {
      review_count : 1
      pattern : "main"
    }
    archived : false
  },
  "product-traceability-foss-frontend" : {
    name : "product-traceability-foss-frontend"
    team_name : "product-traceability-foss"
    description : "DEPRECATED - use https://github.com/eclipse-tractusx/traceability-foss-frontend"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "product-traceability-foss-backend" : {
    name : "product-traceability-foss-backend"
    team_name : "product-traceability-foss"
    description : "DEPRECATED - use https://github.com/eclipse-tractusx/traceability-foss-backend"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "product-esc-backbone-code" : {
    name : "product-esc-backbone-code"
    team_name : "product-esc-backbone"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-trace-cs-webapp" : {
    name : "product-trace-cs-webapp"
    team_name : "product-data-integrity-demonstrator"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-explorer" : {
    name : "product-explorer"
    team_name : "product-explorer"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-core-managed-identity-wallets-cd" : {
    name : "product-core-managed-identity-wallets-cd"
    team_name : "product-managed-identity-wallets"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-behaviour-twin-pilot" : {
    name : "product-behaviour-twin-pilot"
    team_name : "product-behaviour-twin-pilot"
    description : "PLEASE ADD DESCRIPTION"
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-behaviour-twin-pilot-private" : {
    name : "product-behaviour-twin-pilot-private"
    team_name : "product-behaviour-twin-pilot"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-value-added-service" : {
    name : "product-value-added-service"
    team_name : "product-value-added-service"
    description : "Repository for Value Added Service - Country Risk Backend"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : ["catena-x", "java", "spring-boot"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "foss-example" : {
    name : "foss-example"
    team_name : "team-foss"
    description : ""
    visibility : "public"
    has_issues: false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "k8s-cluster-stack" : {
    name : "k8s-cluster-stack"
    team_name : "argocdadmins"
    description : "Bootstrapping k8s clusters with ready to use ArgoCD for k8s management."
    visibility : "public"
    has_issues = true
    has_issues = false
    homepage_url : ""
    topics : ["internal"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-edc" : {
    name : "product-edc"
    team_name : "product-edc"
    description : "Repository for Catena-X specific eclipse dataspace connector apps"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "k8s-helm-example" : {
    name : "k8s-helm-example"
    team_name : "product-team-example"
    description : "Example project for Argo CD integration and also landing pages for ArgoCD environments"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : ["ci-cd", "helm", "internal", "kubernetes"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : true
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "catenax-ng.github.io" : {
    name : "catenax-ng.github.io"
    team_name : "team-foss"
    description : "https://catenax-ng.github.io"
    visibility : "public"
    has_issues = false
    homepage_url : "https://catenax-ng.github.io"
    topics : ["internal"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-test-data-generator" : {
    name : "product-test-data-generator"
    team_name : "product-test-data-generator"
    description : "Catena-X Testdata Generator"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-hello-helm" : {
    name : "product-portal-hello-helm"
    team_name : "product-portal"
    description : "A minimal project template with a CI pipeline for docker"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : true
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-frontend-registration" : {
    name : "product-portal-frontend-registration"
    team_name : "product-portal"
    description : "Catena-X Portal Frontend Registration - DEPRECATED"
    visibility : "public"
    has_issues = false
    homepage_url : "https://portal.demo.catena-x.net/registration/"
    topics : ["catena-x", "frontend", "portal", "registration"]
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : true
    template : {
      owner : "catenax-ng"
      repository : "product-portal-hello-helm"
    }
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-vas-country-risk-frontend" : {
    name : "product-vas-country-risk-frontend"
    team_name : "product-value-added-service"
    description : "Repository for Value Added Service - Country Risk Frontend Dashboard"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : ["catena-x", "react"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-knowledge" : {
    name : "product-knowledge"
    team_name : "product-knowledge"
    description : "Catena-X Knowledge Agents Architecture"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : ["sparql", "rdf", "ids", "edc", "catena-x"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-battery-passport-consumer-app" : {
    name : "product-battery-passport-consumer-app"
    team_name : "product-material-pass"
    description : "DEPRECATED: Repository moved to https://github.com/eclipse-tractusx/digital-product-pass"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : ["deprecated"]
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "gh-org-checks" : {
    name : "gh-org-checks"
    team_name : "argocdadmins"
    description : "GitHub workflow to compile and overview of repository defaults compliance throughout the GitHub org"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : true
    codeowners : {
      review_count : 1
      pattern : "main"
    }
    archived : false
  },
  "maintenance-dashboard" : {
    name : "maintenance-dashboard"
    team_name : "argocdadmins"
    description : "DevSecOps team maintenance dashboard"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : true
    codeowners : {
      review_count : 1
      pattern : "main"
    }
    archived : false
  },
  "product-simple-configurator" : {
    name : "product-simple-configurator"
    team_name : "product-essential-services"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "product-vas-fraud-api" : {
    name : "product-vas-fraud-api"
    team_name : "product-value-added-service"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-vas-fraud-workers" : {
    name : "product-vas-fraud-workers"
    team_name : "product-value-added-service"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-vas-fraud-dashboard" : {
    name : "product-vas-fraud-dashboard"
    team_name : "product-value-added-service"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-vas-fraud-dags" : {
    name : "product-vas-fraud-dags"
    team_name : "product-value-added-service"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-vas-fraud-cd" : {
    name : "product-vas-fraud-cd"
    team_name : "product-value-added-service"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "catena-x-release-deployment" : {
    name : "catena-x-release-deployment"
    team_name : "argocdadmins"
    description : "Consortia deployment configuration for Catena-X releases"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : true
    codeowners : {
      review_count : 1
      pattern : "main"
    }
    archived : false
  },
  "product-daps-registration-service" : {
    name : "product-daps-registration-service"
    team_name : "product-essential-services"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-registry-twin-check" : {
    name : "product-registry-twin-check"
    team_name : "product-registry-twin-check"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-autosetup-backend" : {
    name : "product-autosetup-backend"
    team_name : "product-dft"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-business-partner-certificates" : {
    name : "product-business-partner-certificates"
    team_name : "product-business-partner-certificates"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "product-et-demonstrators" : {
    name : "product-et-demonstrators"
    team_name : "product-et-demonstrators"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : "main"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-item-relationship-service-frontend" : {
    name : "product-item-relationship-service-frontend"
    team_name : "product-item-relationship-service-frontend"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : true
    template : {
      owner : "catenax-ng"
      repository : "k8s-helm-example"
    }
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-esc-backbone-blockexplorer" : {
    name : "product-esc-backbone-blockexplorer"
    team_name : "product-esc-backbone"
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-oem-hi-app" : {
    name : "product-oem-hi-app"
    team_name : "product-behaviour-twin-pilot"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-oem-rul-backend" : {
    name : "product-oem-rul-backend"
    team_name : "product-behaviour-twin-pilot"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-behaviour-twin-libraries" : {
    name : "product-behaviour-twin-libraries"
    team_name : "product-behaviour-twin-pilot"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-r-strategy-assistant" : {
    name : "product-r-strategy-assistant"
    team_name : "product-r-strategy-assistant"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : true
  },
  "tractus-x-release" : {
    name : "tractus-x-release"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : true
      branch : "gh-pages"
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "eclipse-tractusx.github.io" : {
    name : "eclipse-tractusx.github.io"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-bpdm-pool" : {
    name : "product-bpdm-pool"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-bpdm-gate" : {
    name : "product-bpdm-gate"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-bpdm-common" : {
    name : "product-bpdm-common"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-bpdm-cdq-bridge" : {
    name : "product-bpdm-cdq-bridge"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-behaviour-twin-minio" : {
    name : "product-behaviour-twin-minio"
    team_name : ""
    description : ""
    visibility : "private"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-onboarding" : {
    name : "product-onboarding"
    team_name : "argocdadmins"
    description : "Product onboarding to Catena-X environment(s)"
    visibility : "public"
    has_issues = true
    homepage_url : ""
    topics : ["onboarding", "system-team", "consortia-environments"]
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "cloud-infra" : {
    name : "cloud-infra"
    team_name : "argocdadmins"
    description : "Destination Terraform/* - 100"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-portal-swagger" : {
    name : "product-portal-swagger"
    team_name : ""
    description : "Catena-X Portal Swagger"
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  },
  "product-bpdm-env" : {
    name : "product-bpdm-env"
    team_name : ""
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  }
  "product-vcissuer" : {
    name : "product-vcissuer"
    team_name : "product-edc"
    description : ""
    visibility : "public"
    has_issues = false
    homepage_url : ""
    topics : []
    pages : {
      enabled : false
      branch : ""
    }
    is_template : false
    uses_template : false
    template : null
    codeowners_available : false
    codeowners : null
    archived : false
  }
}

github_repositories_teams = {
  # repoName-gh-teamName
  "product-puris-backend-product-puris" : {
    team_name : "product-puris"
    repository : "product-puris-backend"
    permission : "maintain"
  },
  "product-puris-frontend-product-puris" : {
    team_name : "product-puris"
    repository : "product-puris-frontend"
    permission : "maintain"
  },
  "product-bpdm-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "product-bpdm"
    permission : "maintain"
  },
  "product-bpdm-pool-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "product-bpdm-pool"
    permission : "maintain"
  },
  "product-bpdm-gate-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "product-bpdm-gate"
    permission : "maintain"
  },
  "product-bpdm-common-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "product-bpdm-common"
    permission : "maintain"
  },
  "product-bpdm-cdq-bridge-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "product-bpdm-cdq-bridge"
    permission : "maintain"
  },
  "product-bpdm-env-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "product-bpdm-env"
    permission : "maintain"
  },
  "product-semantics-product-semantics" : {
    team_name : "product-semantics"
    repository : "product-semantics"
    permission : "maintain"
  },
  "product-portal-frontend-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-frontend"
    permission : "pull"
  },
  "product-portal-iam-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-iam"
    permission : "pull"
  },
  "product-innovation-radar-product-innovation-radar" : {
    team_name : "product-innovation-radar"
    repository : "product-innovation-radar"
    permission : "maintain"
  },
  "product-portal-backend-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-backend"
    permission : "pull"
  },
  "product-data-integrity-demonstrator-product-data-integrity-demonstrator" : {
    team_name : "product-data-integrity-demonstrator"
    repository : "product-data-integrity-demonstrator"
    permission : "maintain"
  },
  "catenax-at-home-catenax-at-home" : {
    team_name : "product-catenax-at-home"
    repository : "catenax-at-home"
    permission : "maintain"
  },
  "product-catena-x-standardization-product-standardization" : {
    team_name : "product-standardization"
    repository : "product-catena-x-standardization"
    permission : "maintain"
  },
  "catenax-at-home-product-edc" : {
    team_name : "product-edc"
    repository : "catenax-at-home"
    permission : "maintain"
  },
  "product-core-schemas-cx-core-schemas" : {
    team_name : "cx-core-schemas"
    repository : "product-core-schemas"
    permission : "maintain"
  },
  "product-portal-cd-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-cd"
    permission : "pull"
  },
  "DataSpaceConnector-product-managed-identity-wallets" : {
    team_name : "product-managed-identity-wallets"
    repository : "DataSpaceConnector"
    permission : "maintain"
  },
  "product-portal-common-assets-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-common-assets"
    permission : "maintain"
  },
  "product-core-managed-identity-wallets-product-managed-identity-wallets" : {
    team_name : "product-managed-identity-wallets"
    repository : "product-core-managed-identity-wallets"
    permission : "maintain"
  },
  "product-dft-backend-product-dft" : {
    team_name : "product-dft"
    repository : "product-dft-backend"
    permission : "maintain"
  },
  "product-dft-frontend-product-dft" : {
    team_name : "product-dft"
    repository : "product-dft-frontend"
    permission : "maintain"
  },
  "product-sd-hub-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "product-sd-hub"
    permission : "maintain"
  },
  "product-omejdn-server-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "product-omejdn-server"
    permission : "maintain"
  },
  "product-DAPS-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "product-DAPS"
    permission : "maintain"
  },
  "product-daps-registration-service-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "product-daps-registration-service"
    permission : "maintain"
  },
  "product-item-relationship-service-product-traceability-irs" : {
    team_name : "product-traceability-irs"
    repository : "product-item-relationship-service"
    permission : "pull"
  },
  "product-testdata-2-edc-product-data-integrity-demonstrator" : {
    team_name : "product-data-integrity-demonstrator"
    repository : "product-testdata-2-edc"
    permission : "maintain"
  },
  "product-esc-backbone-product-esc-backbone" : {
    team_name : "product-esc-backbone"
    repository : "product-esc-backbone"
    permission : "maintain"
  },
  "product-traceability-foss-frontend-product-traceability-foss" : {
    team_name : "product-traceability-foss"
    repository : "product-traceability-foss-frontend"
    permission : "pull"
  },
  "product-traceability-foss-backend-product-traceability-foss" : {
    team_name : "product-traceability-foss"
    repository : "product-traceability-foss-backend"
    permission : "pull"
  },
  "product-esc-backbone-code-product-esc-backbone" : {
    team_name : "product-esc-backbone"
    repository : "product-esc-backbone-code"
    permission : "maintain"
  },
  "product-explorer-product-explorer" : {
    team_name : "product-explorer"
    repository : "product-explorer"
    permission : "maintain"
  },
  "product-core-managed-identity-wallets-cd-product-managed-identity-wallets" : {
    team_name : "product-managed-identity-wallets"
    repository : "product-core-managed-identity-wallets-cd"
    permission : "maintain"
  },
  "product-behaviour-twin-pilot-product-behaviour-twin-pilot" : {
    team_name : "product-behaviour-twin-pilot"
    repository : "product-behaviour-twin-pilot"
    permission : "maintain"
  },
  "product-behaviour-twin-pilot-private-product-behaviour-twin-pilot" : {
    team_name : "product-behaviour-twin-pilot"
    repository : "product-behaviour-twin-pilot-private"
    permission : "maintain"
  },
  "product-value-added-service-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-value-added-service"
    permission : "maintain"
  },
  "foss-example-team-foss" : {
    team_name : "team-foss"
    repository : "foss-example"
    permission : "maintain"
  },
  "product-idses-frontend-apps-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "product-idses-frontend-apps"
    permission : "maintain"
  },
  "k8s-cluster-stack-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "k8s-cluster-stack"
    permission : "admin"
  },
  "product-portal-frontend-registration-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-frontend-registration"
    permission : "pull"
  },
  "product-edc-product-edc" : {
    team_name : "product-edc"
    repository : "product-edc"
    permission : "maintain"
  },
  "product-edc-product-managed-identity-wallets" = {
    team_name : "product-managed-identity-wallets"
    repository : "product-edc"
    permission : "maintain"
  },
  "k8s-helm-example-product-team-example" : {
    team_name : "product-team-example"
    repository : "k8s-helm-example"
    permission : "maintain"
  },
  "catenax-ng.github.io-team-foss" : {
    team_name : "team-foss"
    repository : "catenax-ng.github.io"
    permission : "maintain"
  },
  "catenax-ng.github.io-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "catenax-ng.github.io"
    permission : "admin"
  },
  "product-test-data-generator-product-test-data-generator" : {
    team_name : "product-test-data-generator"
    repository : "product-test-data-generator"
    permission : "maintain"
  },
  "product-vas-country-risk-frontend-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-vas-country-risk-frontend"
    permission : "maintain"
  },
  "product-knowlege-product-knowledge" : {
    team_name : "product-knowledge"
    repository : "product-knowledge"
    permission : "maintain"
  },
  "gh-org-checks-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "gh-org-checks"
    permission : "admin"
  },
  "product-battery-passport-consumer-app-product-material-pass" : {
    team_name : "product-material-pass"
    repository : "product-battery-passport-consumer-app"
    permission : "maintain"
  },
  "maintenance-dashboard-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "maintenance-dashboard"
    permission : "admin"
  },
  "product-simple-configurator-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "product-simple-configurator"
    permission : "maintain"
  },
  "product-vas-fraud-api-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-vas-fraud-api"
    permission : "maintain"
  },
  "product-vas-fraud-workers-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-vas-fraud-workers"
    permission : "maintain"
  },
  "product-vas-fraud-dashboard-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-vas-fraud-dashboard"
    permission : "maintain"
  },
  "product-vas-fraud-dags-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-vas-fraud-dags"
    permission : "maintain"
  },
  "product-vas-fraud-cd-product-value-added-service" : {
    team_name : "product-value-added-service"
    repository : "product-vas-fraud-cd"
    permission : "maintain"
  },
  "catena-x-release-deployment-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "catena-x-release-deployment"
    permission : "admin"
  },
  "catena-x-release-deployment-release-management" : {
    team_name : "release-management"
    repository : "catena-x-release-deployment"
    permission : "maintain"
  },
  "catena-x-release-deployment-test-management" : {
    team_name : "test-management"
    repository : "catena-x-release-deployment"
    permission : "maintain"
  },
  "catena-x-release-deployment-product-portal" : {
    team_name : "product-portal"
    repository : "catena-x-release-deployment"
    permission : "push"
  },
  "catena-x-release-deployment-product-semantics" : {
    team_name : "product-semantics"
    repository : "catena-x-release-deployment"
    permission : "push"
  },
  "catena-x-release-deployment-product-essential-services" : {
    team_name : "product-essential-services"
    repository : "catena-x-release-deployment"
    permission : "push"
  },
  "catena-x-release-deployment-product-bpdm" : {
    team_name : "product-bpdm"
    repository : "catena-x-release-deployment"
    permission : "push"
  },
  "catena-x-release-deployment-product-managed-identity-wallets" : {
    team_name : "product-managed-identity-wallets"
    repository : "catena-x-release-deployment"
    permission : "push"
  },
  "product-data-integrity-demonstrator-product-trace-cs-webapp" : {
    team_name : "product-data-integrity-demonstrator"
    repository : "product-trace-cs-webapp"
    permission : "maintain"
  },
  "product-registry-twin-check-product-registry-twin-check" : {
    team_name : "product-registry-twin-check"
    repository : "product-registry-twin-check"
    permission : "maintain"
  },
  "product-autosetup-backend-product-dft" : {
    team_name : "product-dft"
    repository : "product-autosetup-backend"
    permission : "maintain"
  },
  "product-business-partner-certificates-product-business-partner-certificates" : {
    team_name : "product-business-partner-certificates"
    repository : "product-business-partner-certificates"
    permission : "maintain"
  },
  "product-et-demonstrators-product-et-demonstrators" : {
    team_name : "product-et-demonstrators"
    repository : "product-et-demonstrators"
    permission : "maintain"
  },
  "product-item-relationship-service-frontend-product-item-relationship-service-frontend" : {
    team_name : "product-item-relationship-service-frontend"
    repository : "product-item-relationship-service-frontend"
    permission : "maintain"
  },
  "product-esc-backbone-blockexplorer-product-esc-backbone" : {
    team_name : "product-esc-backbone"
    repository : "product-esc-backbone-blockexplorer"
    permission : "maintain"
  },
  "product-oem-hi-app-product-behaviour-twin-pilot" : {
    team_name : "product-behaviour-twin-pilot"
    repository : "product-oem-hi-app"
    permission : "maintain"
  },
  "product-oem-rul-backend-product-behaviour-twin-pilot" : {
    team_name : "product-behaviour-twin-pilot"
    repository : "product-oem-rul-backend"
    permission : "maintain"
  },
  "product-behaviour-twin-libraries-product-behaviour-twin-pilot" : {
    team_name : "product-behaviour-twin-pilot"
    repository : "product-behaviour-twin-libraries"
    permission : "maintain"
  },
  "product-r-strategy-assistant-product-r-strategy-assistant" : {
    team_name : "product-r-strategy-assistant"
    repository : "product-r-strategy-assistant"
    permission : "maintain"
  },
  "product-behaviour-twin-minio-product-behaviour-twin-minio" : {
    team_name : "product-behaviour-twin-pilot"
    repository : "product-behaviour-twin-minio"
    permission : "maintain"
  },
  "product-onboarding-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "product-onboarding"
    permission : "admin"
  },
  "cloud-infra-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "cloud-infra"
    permission : "admin"
  },
  "product-portal-swagger-product-portal" : {
    team_name : "product-portal"
    repository : "product-portal-swagger"
    permission : "maintain"
  },
  "eclipse-tractusx.github.io-argocdadmins" : {
    team_name : "argocdadmins"
    repository : "eclipse-tractusx.github.io"
    permission : "admin"
  },
  "eclipse-tractusx.github.io-traceability-spec" : {
    team_name : "traceability-spec"
    repository : "eclipse-tractusx.github.io"
    permission : "maintain"
  }
  "product-vcissuer-product-edc" : {
    team_name : "product-edc"
    repository : "product-vcissuer"
    permission : "maintain"
  }
}
