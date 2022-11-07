<div class="card card-size-25x35 card-unit">
    <div class="card-content-container">
        <div class="heading content-padding">
            <img src="{{icon}}" class="icon">
            {{#if bg}}
            <img src="assets/bgs/{{bg}}" class="card-portrait"/>
            {{/if}}
            <div class="title">
                <div class="primary-title">
                    {{name}}
                </div>

                <div class="sub-title">
                    {{type}}
                </div>

                <div class="faction">
                    {{faction}}
                </div>
            </div>
        </div>

        <table class="table-stats">
            <thead>
            <tr class="heading-row">
                <th>SIG</th>
                <th>SPD</th>
                <th>SCAN</th>
                <th>TARG</th>
                <th>DEF</th>
                <th>CM</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><small>{{{null_dash signature}}}</small></td>
                <td>{{null_dash speed}}{{#if speed}}"{{/if}}</td>
                <td>{{null_dash scan}}</td>
                <td>{{null_dash targeting}}</td>
                <td>{{null_dash defense}}</td>
                <td>{{#if cm_regen}}
                    {{cm}}/{{cm_regen}}
                    {{else}}
                    {{null_dash cm}}
                    {{/if}}
                </td>
            </tr>
            </tbody>
        </table>

        {{#if actions}}
        <div class="actions">
            <table class="table-actions">
                <thead>
                <tr class="heading-row">
                    <th>Actions</th>
                    <th class="col-cost">Cost</th>
                    <th class="col-type">Target</th>
                    <th class="col-range">Range</th>
                    <th class="col-rof">ROF</th>
                    <th class="col-effect">Effect</th>
                </tr>
                </thead>
                <tbody>
                {{#each actions}}
                {{#if no_stats}}
                <tr class="action-row action-row-no-stats">
                    <td colspan="6"{{{style_font_size ../body_font_size}}}>
                        {{> key-value .}}
                    </td>
                </tr>
                {{else}}
                <tr class="action-row"{{{style_font_size ../body_font_size}}}>
                    <td class="col-name"><strong>{{name}}</strong> {{#if note}}
                        {{#if line_break_note}}<br>{{/if}}
                        <small{{{style_font_size note_font_size}}}>({{note}})</small>{{/if}}
                        {{#if type}}
                        [{{type}}]{{/if}}
                    </td>
                    <td class="col-cost">

                        {{#if cost.COST_ACTION}}
                        <span class="cost-icon-action">A</span>
                        {{/if}}
                        {{#if cost.COST_COMMAND}}
                        <span class="cost-icon-command">C</span>
                        {{/if}}

                        {{#if cost.COST_COMMAND_X2}}
                        <span class="cost-icon-command-x2">C2</span>
                        {{/if}}

                        {{#if cost.COST_ACTION_AND_COMMAND}}
                        <span class="cost-icon-action-and-command">A+C</span>
                        {{/if}}

                        {{#if cost.COST_ACTION_OR_COMMAND}}
                        <span class="cost-icon-action-or-command">A/C</span>
                        {{/if}}

                    </td>
                    <td class="col-target">{{target}}</td>
                    <td class="col-range">{{#if range}}{{range}}"{{else}}-{{/if}}</td>
                    <td class="col-rof">{{null_dash rof}}</td>
                    <td class="col-effect">{{{effect}}}</td>
                </tr>
                {{#if desc}}
                <tr class="action-description-row">
                    <td colspan="6"{{{style_font_size ../body_font_size}}}>
                        {{{desc}}}
                    </td>
                </tr>
                {{/if}}
                {{#if traits}}
                <tr class="action-features-row">
                    <td colspan="6"{{{style_font_size ../body_font_size}}}>
                        <div class="features">
                            {{#each traits as |trait|}}
                            {{> key-value trait class='feature'}}
                            {{/each}}
                        </div>
                    </td>
                </tr>
                {{/if}}
                {{/if}}
                {{/each}}
                </tbody>
            </table>
        </div>
        {{/if}}

        {{#if traits.length}}
        <h3 class="section-heading">
            Traits
        </h3>
        <div class="traits content-padding"{{{style_font_size body_font_size}}}>
            {{#each traits as |trait|}}
            {{> key-value trait}}

            {{#if trait.traits}}
            <div class="features">
                {{#each trait.traits as |trait2|}}
                {{> key-value trait2 class='feature'}}
                {{/each}}
            </div>
            {{/if}}
            {{/each}}
        </div>
        {{/if}}

        {{#if taskforce_ability}}
        <h3 class="section-heading">
            Taskforce Ability
        </h3>

        <div class="content-padding"{{{style_font_size body_font_size}}}>
            {{> key-value taskforce_ability}}

            {{#if taskforce_ability.traits}}
            <div class="features">
                {{#each taskforce_ability.traits as |trait3|}}
                {{> key-value trait3 class='feature'}}
                {{/each}}
            </div>
            {{/if}}
        </div>
        {{/if}}

        {{#if definitions.length}}
        <h3 class="section-heading">
            Notes
        </h3>
        <div class="actions content-padding"{{{style_font_size body_font_size}}}>
            {{#each definitions as |definition|}}
            {{> key-value definition}}
            {{/each}}
        </div>
        {{/if}}

        <div class="sub-footer">
            GENERATED: {{timestamp}}
        </div>
    </div>
</div>
