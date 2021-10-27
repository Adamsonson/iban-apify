# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

Iban.create([{ name: 'Albania', iban_number: 'AL35202111090000000001234567' },
             { name: 'Cyprus', iban_number: 'CY21002001950000357001234567' },
             { name: 'Greece', iban_number: 'GR9608100010000001234567890' },
             { name: 'Italy', iban_number: 'IT60X0542811101000000123456' }])
