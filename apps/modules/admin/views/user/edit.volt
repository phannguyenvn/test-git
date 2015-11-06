<div class="padding-md">
    {{ content() }}
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <form method="post" enctype="multipart/form-data" class="form-horizontal form-border no-margin" id="basic-constraint" data-validate="parsley"
                      novalidate>
                    <div class="panel-heading">
                        <h3 class="panel-title">Edit User</h3>
                    </div>
                    <div class="panel-body">

                        <div class="form-group">
                            <label class="col-lg-2 control-label">Avatar</label>
                            <div class="col-lg-10">
                                <img width="100" height="100" src="{{ user.getAvatar() }}" />
                                <input type="file" name="avatar">
                            </div><!-- /.col -->
                        </div>

                        <div class="form-group">
                            <label class="control-label col-md-2">Name</label>

                            <div class="col-md-8">
                                <input type="text" name="name" class="form-control input-sm" data-required="true" placeholder="Name"
                                       value="{{user.name}}">
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /form-group -->
                        <div class="form-group">
                            <label class="control-label col-md-2">Email</label>

                            <div class="col-md-8">
                                <input type="text" name="email" class="form-control input-sm" data-required="true" data-type="email" placeholder="Email"
                                       value="{{user.email}}">
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /form-group -->
                        <div class="form-group">
                            <label class="control-label col-md-2">Gender</label>

                            <div class="col-md-8">
                                <label class="label-radio inline">
                                    <input type="radio" name="gender" value="male" {% if user.gender == "male" %} checked {% endif %}>
                                    <span class="custom-radio"></span>
                                    Male
                                </label>
                                <label class="label-radio inline">
                                    <input type="radio" name="gender" value="female" {% if user.gender == "female" %} checked {% endif %}>
                                    <span class="custom-radio"></span>
                                    Female
                                </label>
                            </div>
                            <!-- /.col -->
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2">User Group</label>
                            <div class="col-lg-8">
                                <select class="form-control chzn-select" name="role">
                                    {% for name, value in roles %}
                                        {% if user.role == name %}
                                            <option selected value="{{name}}">{{value}}</option>
                                        {% else %}
                                            <option value="{{name}}">{{value}}</option>
                                        {% endif %}
                                    {% endfor %}
                                </select>
                            </div><!-- /.col -->
                        </div><!-- /form-group -->

                        <div class="form-group">
                            <label class="control-label col-md-2">Phone</label>
                            <div class="col-md-8">
                                <input type="text" name="phone" class="form-control input-sm">
                            </div><!-- /.col -->
                        </div><!-- /form-group -->

                        <div class="form-group">
                            <label class="control-label col-md-2">Address</label>
                            <div class="col-md-8">
                                <textarea class="form-control" name="address" rows="3"></textarea>
                            </div><!-- /.col -->
                        </div><!-- /form-group -->
                    </div>
                    <div class="panel-footer clearfix">
                        <div class="pull-right">
                            <button type="submit" class="btn btn-success">Update</button>
                        </div>
                    </div>
                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                </form>
            </div>
            <!-- /panel -->
        </div>
    </div>
</div>
