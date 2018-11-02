use_frameworks!
install! 'cocoapods', :deterministic_uuids => true, :integrate_targets => true, :lock_pod_sources => false

abstract_target "abstract" do
  platform :ios, "9.3"

  pod "pieces", :path => "."

  target "demo"
end
