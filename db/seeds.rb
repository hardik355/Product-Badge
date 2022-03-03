# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Examples:


Plan.find_or_create_by(title: 'Free', alias_name: 'free', price: 0, descriptions: 'Multiple bundle creation only, Up to 2 active bundles, Quantity based notification, Bundle Products inventory management, Review Bundles')
Plan.find_or_create_by(title: 'Silver', alias_name: 'silver', price: 19.99, descriptions: 'Multiple bundle creation, Variant selection in the master product, Up to 5 active bundles, Quantity based notification, Bundle Products inventory management, Review Bundles')
Plan.find_or_create_by(title: 'Gold', alias_name: 'gold', price: 39.99, descriptions: 'Multiple bundle creation, Variant selection in the master product, Unlimited active bundles, Quantity based notification, Bundle Products inventory management, Review Bundles')
Plan.find_or_create_by(title: 'Platinum', alias_name: 'platinum', price: 49.99, descriptions: 'Multiple bundle creation, Variant selection in the master product, Unlimited active bundles, Quantity based notification, Bundle Products inventory management, Review Bundles')
