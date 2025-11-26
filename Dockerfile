FROM mellowcube/passoire-group18-base:v1.0.0

# This is the initial command to start the Passoire application
CMD ["/passoire/init.sh"]

# 1. Remove flag_3
RUN rm /passoire/web/flag_3

# 2. Patch index.php to remove flag_4 in HTML comment
COPY patch/passoire/web/index.php /passoire/web/index.php

