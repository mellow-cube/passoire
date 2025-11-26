FROM mellowcube/passoire-group18-base:v1.0.0

# This is the initial command to start the Passoire application
CMD ["/passoire/init.sh"]

# Remove flag_3, vulnerability No. 1
RUN rm /passoire/web/flag_3

