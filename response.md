# STIGS

To comply with the STIG rule V-251226 for Redis Enterprise DBMS on a RHEL machine, you'll need to enforce authorized access to all PKI private keys used by Redis Enterprise. Here's how to do it:

1. **Locate the Certificate Storage Directory**: Identify where Redis Enterprise stores its certificates. The default location is often `/etc/opt/redislabs`, but it could vary based on your organization's setup.

2. **Verify Directory Ownership**:
   - Use the command `ls -ld /etc/opt/redislabs` to check the current ownership and permissions of the directory.
   - If the directory is not owned by an appropriate admin user and group (usually `redislabs`), change the ownership.

3. **Change Ownership**:
   - Run `sudo chown redislabs:redislabs /etc/opt/redislabs`.
   - This command sets both the user and group ownership of the `/etc/opt/redislabs` directory to `redislabs`.

4. **Set Directory Permissions**:
   - Use the command `sudo chmod 700 /etc/opt/redislabs`.
   - This sets the permissions so that only the owner (`redislabs`) can read, write, and execute files in this directory.

5. **Apply Permissions to Certificate File**:
   - If you need to specifically update the permissions of the `proxy_cert.pem` file, use the command `sudo chmod 700 /etc/opt/redislabs/proxy_cert.pem`.
   - This ensures that the certificate file is also protected with the same restrictive permissions.

6. **Verify the Changes**:
   - After executing these commands, you can verify the changes by running `ls -l /etc/opt/redislabs` and `ls -l /etc/opt/redislabs/proxy_cert.pem`.
   - Ensure the output reflects the correct ownership and permissions (i.e., `redislabs` as the owner and group, and `700` permissions).

7. **Document the Configuration**:
   - It's important to document these changes as part of your system's security configuration.
   - Include details about the location of the certificates, the ownership, and the permissions set.

Remember, these actions require administrative privileges. Always ensure you have proper authorization and backup necessary files before making changes to system configurations.

# Next

To comply with STIG rule V-251228 for Redis Enterprise DBMS, which concerns obscuring authentication information during the process, follow these steps:

1. **Documentation and Approval**:
   - **Document the Need**: Clearly outline why plain-text password usage in Redis CLI tools or other essential tools is necessary. Include details about the specific situations or functions that require this approach.
   - **Identify Users**: List the individuals or roles that will use these tools with plain-text password capabilities.
   - **Mitigation Strategies**: Describe any measures you're taking to minimize the risks associated with using plain-text passwords.
   - **Obtain Approval**: Submit this documentation to the Authorizing Official (AO) for your organization for approval. This step is crucial for ensuring that the use of such tools is sanctioned and monitored.

2. **Training for Users**:
   - **Avoid Plain-Text Passwords**: Train all users of these tools on the importance of avoiding the use of plain-text password options whenever possible.
   - **Password Obfuscation Method**: Instruct users on how to use the `--askpass` option with Redis CLI tools. This method prompts the user for a password, which is then obscured or hidden, enhancing security.
   - **Reinforce Best Practices**: Ensure users understand the importance of safeguarding passwords and the potential risks of mishandling authentication information.

3. **Example Command for Secure Authentication**:
   - To authenticate securely using the Redis CLI, advise users to use a command structure like: 
     ```
     redis-cli -h <db_endpoint> -p <port> --askpass
     ```
   - In this command, `<db_endpoint>` should be replaced with the database endpoint, and `<port>` with the appropriate port number. The `--askpass` option will prompt for the password without displaying it on the screen or storing it in the command history.

Implementing these steps ensures that authentication information is protected during the authentication process, reducing the risk of unauthorized access and potential exploitation.


