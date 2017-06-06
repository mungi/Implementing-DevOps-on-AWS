packer:
  archive.extracted:
    - name: /opt/
    - source: 'https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip'
    - source_hash: sha256=ed697ace39f8bb7bf6ccd78e21b2075f53c0f23cdfb5276c380a053a7b906853
    - archive_format: zip
    - enforce_toplevel: false
    - if_missing: /opt/packer

  cmd.wait:
    - name: 'chmod +x /opt/packer'
    - watch:
      - archive: packer

