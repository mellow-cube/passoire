# Passoire – Security Issues

## Overview

| No. | Flag    | Short Description       |
| :-: | ------- | ----------------------- |
| 1   | flag_3  | File in web directory   |
| 2   | flag_4  | Comment in HTML code    |

## Details

1. The file is located in the web server and accessible via a simple HTTP request. Its location is `/passoire/flag_3`.
It has been removed via a command in the Dockerfile.
2. A comment in the website (file `/passoire/index.php`) contained leaked information (flag_4). The file has been patched to remove it.

