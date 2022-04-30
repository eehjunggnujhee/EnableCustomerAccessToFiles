# Enable Customer Access to a File Inherited through a Record Permission

Scenario: A client has an experience site where they engage with community users with. Both the internal staff and the community users maintain records on standards and custom objects and exchnage notes and files uploaded to those records. The clinet wishes that the file View permission is enabled by default when a staff upload a file to a record where a community user also have either View or Edit access.

## Steps to Test

1. Clone this repository
    ```shell
    $ git clone EnableCustomerAccessToFiles.git
    ```

2. Spin up a scratch org by running CumulusCI commnads
    ```shell
    $ cci org scratch dev fileAccess --days 30 # 30days scratch org lifetime
    $ cci flow run dev_org --org fileAccess
    ```
3. Enable File Access to Set By Record
![](assets/01_FileAccessToSetByRecord.png)

4. Enabled Experience Site
![](assets/02_EnableDigitalExperience.png)

5. Upload a file to an account record and validate that the file is viewable by community users
![](assets/03_CustomerAccessEnabled.png)

6. Add additional FileCustomerAccessObject records for other objects that you want to set up the same view permission to the related files.
![](assets/04_FileCudstomerAccessObject.png)
<img src="assets/04_FileCudstomerAccessObject.png" width="500">
