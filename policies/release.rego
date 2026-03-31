package release

default allow := false

deny contains "SBOM report is missing" if {
  not input.sbom.present
}

deny contains msg if {
  input.trivy.high_or_critical > 0
  msg := sprintf("Trivy found %d HIGH/CRITICAL vulnerabilities", [input.trivy.high_or_critical])
}

deny contains msg if {
  input.zap.fail_new > 0
  msg := sprintf("ZAP reported %d FAIL findings", [input.zap.fail_new])
}

deny contains "Artifact signature verification did not complete" if {
  not input.artifact.signature_verified
}

deny contains "Staging deployment health verification did not complete" if {
  not input.deployment.staging_healthy
}

allow if count(deny) == 0
