# frozen_string_literal: true

# Marginalia.application_name = 'BA'
Marginalia::Comment.prepend_comment = true

Marginalia::Comment.components = %i[application controller_with_namespace action line]
