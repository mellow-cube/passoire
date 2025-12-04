# Passoire – Security Issues

## TODO
* The `passoire/uploads/` folder is currently readily accessible; it needs to be hidden for users which are not logged in (see "Latent issues").
* The password of `john_doe` is currently `123456`
* The mysql database password is very insecure (currently just `airborne`); also, the password storage could be improved?
    * Also, the password is hardcoded into the `db_connect.php`
* The SQL API is vulnerable to SQL injections (files `index.php` and `db_connect.php`)
* The service currently uses HTTP. Should it be switched to HTTPS?
* There is `flag_1`, of the `passoire` user. What to do about it?
    * Ensure the password is secure.
* There are probably open ports

## Fixed issues
### Overview

| No. | Flag    | Short Description       |
| :-: | ------- | ----------------------- |
| 1   | flag_3  | File in web directory   |
| 2   | flag_4  | Comment in HTML code    |
| 3   | flag_11 | Unused binary file      |
| 4   | flag_14 | Superfluous user        |

### Details

1. The file is located in the web server and accessible via a simple HTTP request. Its location is `/passoire/flag_3`.
It has been removed via a command in the Dockerfile.
2. A comment in the website (file `/passoire/index.php`) contained leaked information (flag_4). The file has been patched to remove it.
3. The binary file `/passoire/my_own_cryptographic_algorithm` was unused and contained a secret, flag_11, (you shouldn't do your own cryptographic routines, anyhow); it has been removed.
4. The user `admin` was superfluous (there already is a `root` user) and probably dangerous, so it has been removed. The associated home directory, `/home/admin` has been removed, along with the associated flag, flag_14, file `/home/admin/flag_14`.

## Latent issues

These are issues that cannot be simply "fixed" but are instead the result of vulnerabilities in entire sub-systems.

| Flag | Issue | Files |
| ---- | ----- | ----- |
| flag_2 | Root access (file in home directory of root user). | `/root/flag_2` |
| flag_6 | | `/passoire/web/uploads/flag_6` |
| flag_7 | | `/passoire/web/uploads/secret` |
| ?????? | | `/passoire/web/uploads/encrypted` |
| flag_9 | Insecurities in crypto API. | `/passoire/crypto-helper/flag_9` |
| flag_13 | Direct read access to webpage files. | `passoire/index.php` |

## Other notes

* The `mysql` user has a `/nonexistent` directory (this is also noted on startup). Is this a problem? (See `/etc/passwd`)
* What are the user passwords? Are they secure?
* SSH connections / Bridges?
* FTP connections?
* There is a user called simply `a`, with purported home directory `/home/a`.
