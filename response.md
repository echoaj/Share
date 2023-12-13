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