---
  - name: Provision an EC2 Instance
    hosts: localhost
    connection: local
    gather_facts: False
    tags: provisioning
    # Necessary Variables for creating/provisioning the EC2 Instance
    vars:
      instance_type: t2.micro
      security_group: webserver-sg # Change the security group name here
      image: ami-***** # Change the AMI, from which you want to launch the server
      region: us-west-2 # Change the Region
      keypair: keypair # Change the keypair name
      count: 1

    # Task that will be used to Launch/Create an EC2 Instance
    tasks:

      - name: Create a security group
        local_action:
          module: ec2_group
          name: "{{ security_group }}"
          description: Security Group for webserver Servers
          region: "{{ region }}"
          rules:
            - proto: tcp
              from_port: 22
              to_port: 22
              cidr_ip: 0.0.0.0/0
            - proto: tcp
              from_port: 80
              to_port: 80
              cidr_ip: 0.0.0.0/0
          rules_egress:
            - proto: all
              cidr_ip: 0.0.0.0/0


      - name: Launch the new EC2 Instance
        local_action: ec2
                      group={{ security_group }}
                      instance_type={{ instance_type}}
                      image={{ image }}
                      wait=true
                      region={{ region }}
                      key_name={{ keypair }}
                      count={{count}}
                      vpc_subnet_id=subnet-ac3319c8
                      assign_public_ip=yes
        register: ec2

      - name: Wait for SSH to come up
        local_action: wait_for
"myec2.yml" 91L, 2904C
