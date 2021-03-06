<div class="padding-md">
    {{ content() }}
    {{ flashSession.output() }}
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default table-responsive">
                <div class="panel-heading clearfix">
                    <div class="input-group pull-left">
                        <h3 class="panel-title"><i class="fa fa-user"></i> Manage users</h3>
                    </div>
                    <div class="input-group pull-right">
                        <a href="{{url('admin/user/add')}}" class="btn btn-sm btn-success"> Add User</a>
                    </div>
                </div>
                <div class="panel-body clearfix">
                        <div class="input-group">
                            <div class="input-group-btn">
                                <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">Filter users <span class="caret"></span></button>
                                <div class="dropdown-menu dropdown-filter-box " >
                                    <h3>Show all user where:</h3>
                                    <div class="form-group inline">
                                        <select id="filter" class="input-sm custom-form">
                                            <option value="">Select a filter..</option>
                                            <option value="email">Email</option>
                                            <option value="role">Role</option>
                                            <option value="status">Status</option>
                                        </select>
                                    </div>
                                    <div class="form-group hide">
                                        <input type="text" name="filter[email]" data-type="email" value="{{parameter['email']}}" class="input-sm custom-form">
                                    </div>
                                    <div class="form-group hide">
                                        <select name="filter[status]" data-type="status" class="input-sm custom-form">
                                            <option value="all">Select a user state</option>
                                            {% for id, value in status %}
                                                {% if id == parameter['status'] %}
                                                    <option selected value="{{id}}">{{value}}</option>
                                                {% else %}
                                                    <option value="{{id}}">{{value}}</option>
                                                {% endif %}
                                            {% endfor %}
                                        </select>
                                    </div>
                                    <div class="form-group hide">
                                        <select name="filter[role]" data-type="role" class="input-sm custom-form">
                                            <option value="all">Select a role</option>
                                            {% for name, value in roles %}
                                                {% if name == parameter['role'] %}
                                                    <option selected value="{{name}}">{{value}}</option>
                                                {% else %}
                                                    <option value="{{name}}">{{value}}</option>
                                                {% endif %}
                                            {% endfor %}
                                        </select>
                                    </div>
                                    <div class="form-group inline">
                                        <input type="button" class="btn btn-sm btn-info inline addFilter" value="Add Filter">
                                    </div>
                                </div>
                            </div>

                                <input type="text" name="q" id="search" class="form-control input-sm" value="{{ parameter['keyword'] }}" placeholder="Search user by name, email..." aria-controls="dataTable">
                                <span class="input-group-btn">
                                    <button id="btnSearch" class="btn btn-default btn-sm" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>

                        </div>
                        {% if count(filterTag) %}
                        <div class="filter-tags">
                            <ul class="col-md-12 active-filters horizontal">
                                {% for tag in filterTag %}
                                <li class="tag">
                                    <span>
                                        <em>{{tag['name']}} is equal to <b>{{tag['value']}}</b></em>
                                        <span class="close closeFilter" data-type="{{tag['key']}}"><i class="fa fa-times"></i></span>
                                    </span>
                                </li>
                                {% endfor %}
                            </ul>
                        </div>
                        {% endif %}
                </div>

                <form method="post" name="appForm">
                    {% if users.total_items > 0 %}
                    <table class="table table-striped" id="responsiveTable">
                        <thead>
                        <tr>
                            <th>
                                <label class="label-checkbox">
                                    <input type="checkbox" id="chk-all">
                                    <span class="custom-checkbox"></span>
                                </label>
                            </th>
                            <th class="{% if sort == 'id' %}sorted{% else %}sortable{% endif %}">
                                <a href="{{url(orderUrl)}}sort=id&{% if sort == 'id' and dir|lower == 'asc' %}dir=desc{% else %}dir=asc{% endif %}{% if pagination.current > 1 %}&page={{pagination.current}}{% endif %}">
                                    ID {% if sort == 'id' and dir|lower == 'desc' %}<i class="fa fa-caret-down"></i>{% else %}<i class="fa fa-caret-up"></i>{% endif %}
                                </a>
                            </th>
                            <th class="{% if sort == 'name' %}sorted{% else %}sortable{% endif %}">
                                <a href="{{url(orderUrl)}}sort=name&{% if sort == 'name' and dir|lower == 'asc' %}dir=desc{% else %}dir=asc{% endif %}{% if pagination.current > 1 %}&page={{pagination.current}}{% endif %}">
                                    Name {% if sort == 'name' and dir|lower == 'desc' %}<i class="fa fa-caret-down"></i>{% else %}<i class="fa fa-caret-up"></i>{% endif %}
                                </a>
                            </th>
                            <th class="{% if sort == 'email' %}sorted{% else %}sortable{% endif %}">
                                <a href="{{url(orderUrl)}}sort=email&{% if sort == 'email' and dir|lower == 'asc' %}dir=desc{% else %}dir=asc{% endif %}{% if pagination.current > 1 %}&page={{pagination.current}}{% endif %}">
                                    Email {% if sort == 'email' and dir|lower == 'desc' %}<i class="fa fa-caret-down"></i>{% else %}<i class="fa fa-caret-up"></i>{% endif %}
                                </a>
                            </th>
                            <th>Role</th>
                            <th>User state</th>
                            <th>Date Register</th>
                        </tr>
                        </thead>
                        <tbody>
                        {% for user in users.items %}
                            <tr>
                                <td>
                                    <label class="label-checkbox">
                                        <input type="checkbox" class="chk-row" name="cid[]" value="{{ user.id }}">
                                        <span class="custom-checkbox"></span>
                                    </label>
                                </td>
                                <td>{{user.id}}</td>
                                <td><a href="{{url('admin/user/edit/' ~ user.id)}}" title="Edit this user">{{user.name}}</a></td>
                                <td>{{user.email}}</td>
                                <td>{{user.getRoleName()}}</td>
                                <td><span class="label {{user.getStatusLabel()}}">{{user.getStatusName()}}</span></td>
                                <td>{{ date('M d, Y', user.dateCreated) }}</td>
                            </tr>
                        {% endfor %}
                        </tbody>
                    </table>

                    <div class="panel-footer clearfix">
                        <div class="pull-left form-filter">
                                <select name="selectBulkAction" class="input-sm form-control">
                                    <option value="0">Bulk action</option>
                                    <option value="deletes">Delete</option>
                                </select>
                        </div>
                        <a id="bulk-action" class="btn btn-default btn-sm pull-left">Apply</a>
                        <div class="pull-right">
                            <p class="pagination-showing">
                                Showing {{(users.current - 1) * users.limit + 1}} to 10 of {{users.total_items}} entries
                            </p>
                            {% if pagination.items is defined and pagination.total_pages > 1 %}
                                {% include "layouts/pagination.volt" %}
                            {% endif %}
                        </div>
                    </div>
                    {% else %}
                    <div class="col-md-12">
                        <div class="table-no-record">
                            <p>No user found.</p>
                            <i class="fa fa-user"></i>
                        </div>
                    </div>
                    {% endif %}
                    <input type="hidden" name="boxChecked" value="0" />
                    <input type="hidden" name="sort" value="{{ sort }}" />
                    <input type="hidden" name="dir" value="{{ dir }}" />
                </form>
            </div>
            <!-- /panel -->
        </div>
        <!-- /.col -->
    </div>
</div>
