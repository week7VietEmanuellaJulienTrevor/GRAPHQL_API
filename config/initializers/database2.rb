DB2 = YAML.load_file(File.join(Rails.root, "config", "datawarehouse.yml"))[Rails.env.to_s]